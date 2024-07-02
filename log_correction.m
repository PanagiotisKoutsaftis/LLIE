function NL_image = log_correction(LL_image,control_parameter)

%==========================================================================
% Function that implements the Log correction algorithm. It takes as
% input the Low Light image and the value of the control parameter and
% outputs the image after applying log correction.
% Author: Panagiotis Koutsaftis aivc21010
%==========================================================================

%converting to double needed for operations
LL_image = double(LL_image);

%normalizing the image values before applying log function
norm_LL = LL_image./255;

%applying the log correction function
NL_image = (log10(norm_LL.*control_parameter+1)).*255;

%converting back to uint8 cause we need to return an image
NL_image = uint8(NL_image);