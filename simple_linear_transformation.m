function NL_image = simple_linear_transformation(LL_image,range_min,range_max)

%==========================================================================
% Function for linear stretching of an image. The function takes as input
% the image we want to stretch and the range of the available gray values
% (usually range_min=0 and range_max=255). After that the function applies
% the simple linear stretching algorithm and returns the result.
% Author: Panagiotis Koutsaftis aivc21010
%==========================================================================

%converting the image to double for calculations
LL_image = double(LL_image);

%size of the image
[rows,columns,bands] = size(LL_image);

%dynamic range of the NL image gray values
range_diff = range_max-range_min;

%preallocating the matrix for the NL image with zeros
NL_image = zeros(size(LL_image));

%appliying linear stratching to the RGB components
for band=1:bands
    %x_low
    f_min = min(min(LL_image(:,:,band)));
    %x_high
    f_max = max(max(LL_image(:,:,band)));
    diff = (LL_image(:,:,band)-f_min)./(f_max-f_min);
    temp = round((diff.*range_diff)+range_min);
    NL_image(:,:,band) = temp;
end

%converting the result to uint8
NL_image = uint8(NL_image);

