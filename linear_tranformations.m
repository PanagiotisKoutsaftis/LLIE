close all; clear; clc; format compact;

LL_images = imageDatastore('D:\ΔΙΠΛΩΜΑΤΙΚΗ\TRAINING IMAGES\2.5\LL-2.5');
NL_images = imageDatastore('D:\ΔΙΠΛΩΜΑΤΙΚΗ\TRAINING IMAGES\2.5\NL-2.5');

LL_img = readimage(LL_images,22);
NL_img = readimage(NL_images,22);


% figure
% imshow(LL_img);
% 
% figure
% imshow(NL_img);
% R_hist = imhist(LL_img(:,:,1));
% figure
% imhist(LL_img(:,:,1))
% ylim([0,max(imhist(LL_img(:,:,1)))])
% %hold on
% %imhist(LL_img(:,:,2))
% %imhist(LL_img(:,:,3))
% %hold off
% 
% figure
% imhist(NL_img);

% histogram_comparison(LL_img,NL_img);
% 
% NL_image_test = simple_linear_transformation(LL_img,0,255);
% 
% histogram_comparison(LL_img,NL_image_test);
% 
% %psnr_value = psnr(NL_image_test,NL_img);
% 
% [mse,psnr_value,ssim_value,c] = Ref_QA(NL_image_test,NL_img);

[rows,columns,bands] = size(LL_img);
NL_image_test = gamma_correction(LL_img,0.2);

figure
imshow(NL_image_test);
title("Gamma correction");

NL_image2 = log_correction(LL_img,50);
figure
imshow(NL_image2);
title("Log correction");
