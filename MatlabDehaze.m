function NL_image = MatlabDehaze(LL_image)

%==========================================================================
% Function that implements the Dehaze LLIE algorithm. The functions takes
% as input the LL image we want to enhance and outputs the enhanced image.
% Author: Panagiotis Koutsaftis aivc21010
%==========================================================================

%size of the image
[rows,columns,bands] = size(LL_image);

%converting the image to double for the calculations
LL = double(LL_image);

%inverting the image
temp = 255*ones(rows,columns,bands);
inv = uint8(temp - LL);

%applying matlab's dehazing function
final_inv = imreducehaze(inv,Method='approxdcp');

%inverting again
final_inv = temp -double(final_inv);

%final result
NL_image = uint8(final_inv);