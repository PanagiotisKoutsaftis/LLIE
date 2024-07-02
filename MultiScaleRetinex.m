function NL_image = MultiScaleRetinex(LL_image,c_small,c_medium,c_big)

%==========================================================================
%   This function implements the Multi Scale Retinex method for low      
%   light image enhancement reasons. Function inputs:
%   1) LL_image: the low light image
%   2) c_small: value of the small scale (<=20)
%   3) c_medium: value of the medium scale (>20, <=200)
%   4) c_big: value of the big scale (>200)
%   Outputs the enhanced normal light image
%   Article Reference: 
%   D. J. Jobson, Z. Rahman and G. A. Woodell,
%   "A multiscale retinex for bridging the gap between color images
%   and the human observation of scenes," in IEEE Transactions on Image
%   Processing, vol. 6, no. 7, pp. 965-976, July 1997,
%   doi: 10.1109/83.597272.
%
%   Function Author: Panagiotis Koutsaftis
%
%==========================================================================

%checking the values of the surround parameters
if c_small > 20
    error('c_small must be smaller of or equal to 20.')
end
if c_medium<=20 || c_medium>200
    error('c_medium must be in the range [20,200).')
end
if c_big<=200
    error('c_big must be bigger than 200.')
end

%size of the input image
[rows,columns,bands] = size(LL_image);

%initializing the Retinex output with zeros
R_msr = zeros(rows,columns,bands);

%calculating the Retinex output
for band=1:bands
    R_msr(:,:,band) = (double(SingleScaleRetinex(LL_image(:,:,band),c_small)) ...
        +double(SingleScaleRetinex(LL_image(:,:,band),c_medium)) ...
        +double(SingleScaleRetinex(LL_image(:,:,band),c_big))).*(1/3);
end

%final output as uint8
NL_image = uint8(R_msr);

