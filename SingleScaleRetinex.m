function NL_image = SingleScaleRetinex(LL_image,c)

%==========================================================================
%   This function implements the Single Scale Retinex method for low      
%   light image enhancement reasons. It takes as input the low light image
%   and the surround parameter c, used by the surround gaussian function, 
%   and outputs the enhanced normal light image.                         
%   Article Reference:                                                    
%   D. J. Jobson, Z. Rahman, and G. A. Woodell,                           
%   ``Properties and performance of a center/surround retinex,''          
%   IEEE Trans. Image Process., vol. 6, no. 3, pp. 451462, Mar. 1997.
%
%   Function Author: Panagiotis Koutsaftis
% 
%==========================================================================

%size of the input image
[rows,columns,bands] = size(LL_image);

%converting the image to double for calculations
LL_double = double(LL_image);
%normalizing the image by dividing with 255, adding 0.01 for the log
LL_double = (LL_double/255)+0.01;

%center of the image
cent = ceil(rows/2);
%initializing the values of thee filter
filt = zeros(rows,columns);
%initializing a sum needed for normalization reasons
summ = 0;
%creating the gaussian filter
for i=1:rows
    for j=1:columns
        r = ((cent-i)^2+(cent-j)^2);
        filt(i,j) = exp(-(r/(c^2)));
        summ = summ + filt(i,j);
    end
end
%normalizing the values of the filter
filt = filt/summ;

%initializing the output normal light image
NL_image = zeros(rows,columns,bands);

%calculating the retinex for each color band
for band=1:bands
    %convolution with the filter
    conv = imfilter(LL_double(:,:,band),filt,'replicate','same');
    %retinex output
    R = log(LL_double(:,:,band))-log(conv);
    %min value
    R_min = min(min(R));
    R_max = max(max(R));
    %normalizing to [0,255]
    R_t = 255*((R-R_min)./(R_max-R_min));
    %final band output
    NL_image(:,:,band) = R_t;
end

%converting to uint8
NL_image = uint8(NL_image);

