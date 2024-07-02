function NL_image = gamma_correction(LL_image,gamma)

%==========================================================================
% Function that implements the Gamma correction algorithm. It takes as
% input the Low Light image and the value of the exponent and outputs the
% image after applying gamma correction.
% Author: Panagiotis Koutsaftis aivc21010
%==========================================================================

%converting to double needed for operations
LL_image = double(LL_image);

%applying the gamma correction
NL_image = round(((LL_image./255).^gamma).*255);

%converting back to uint8 cause we need to return an image
NL_image = uint8(NL_image);