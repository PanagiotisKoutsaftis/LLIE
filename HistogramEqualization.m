function NL_image = HistogramEqualization(LL_image)

%==========================================================================
% Function that implements the Histogram Equalization Algorithm.
% We are going to use MATLAB's histeq function for optimization reasons.
% The function expects a grayscale image as an input.
% For that reason we apply the function to each channel of the RGB image
% separately.
% Author: Panagiotis Koutsaftis aivc21010
%==========================================================================

%RGB image channels
Red = LL_image(:,:,1);
Green = LL_image(:,:,2);
Blue = LL_image(:,:,3);

%applying histreq
Red_he = histeq(Red);
Green_he = histeq(Green);
Blue_he = histeq(Blue);

%defining an empty matrix with the same size as the input image
NL = zeros(size(LL_image));
NL(:,:,1) = Red_he;
NL(:,:,2) = Green_he;
NL(:,:,3) = Blue_he;

%converting the result to uint8
NL_image = uint8(NL);