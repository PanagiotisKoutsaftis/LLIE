# LLIE
Implementation Low Light Image Enhancement techniques used during my master's thesis

Classical Image Processing Algorithms that were used:

- Basic point based operations: linear streching, gamma transformation, logarithmic transformation

- Histogram Equalization

- Dehaze techniques based on the fact that the inverse of a dark image looks like it was captured captured in hazy lighting conditions[1]. We applied two dehazing methods on the inverse of the LL images, proceeded to invert the final result and acquired the final enhanced image.

- RETINEX methods, in particular Single Scale Retinex and MultiScale Retinex methods[2,3]

Deep Learning Methods that were used:

- Deep Convolutional Neural Network which includes a special-designed convolutional module that allows us to scale the network to larger depths. The module is based on the ideas of the Inception module and Residual learning[4]

- Different implementation of [4] where we trained the model using the difference between the Ground Truth image and the original LL image, an idea based on [5]. The main idea was to learn the distribution that was 'subtracted' from the original image and caused the image to be darker


[1] Xuan Dong et al., "Fast efficient algorithm for enhancement of low lighting video,"
2011 IEEE International Conference on Multimedia and Expo, Barcelona, 2011, pp. 1
6, doi: 10.1109/ICME.2011.6012107.

[2] D. J. Jobson, Z. Rahman and G. A. Woodell, "Properties and performance of a
center/surround retinex," in IEEE Transactions on Image Processing, vol. 6, no. 3, pp.
451 462, March 1997, doi: 10.1109/83.557356.

[3] D. J. Jobson, Z. Rahman and G. A. Woodell, "A multiscale retinex for bridging the
gap between color images and the human observation of scenes," in IEEE Transactions
on Image Processing, vol. 6, no. 7, pp. 965 976, July 1997, doi: 10.1109/83.597272.

[4] L. Tao, C. Zhu, G. Xiang, Y. Li, H. Jia and X. Xie, "LLCNN: A convolutional
neural network for low light image enhancement," 2017 IEEE Visual Communications
and Image Processing (VCIP), St. Petersburg, FL, USA, 2017, pp. 1 4, doi:
10.1109/VCIP.2017.8305143.

[5] Sheng He, Lambert DeepOtsu: Document enhancement and binariza-
tion using iterative deep learning, Pattern Recognition, Volume 91, 2019, Pages 379
390, ISSN 0031 3203, https://doi.org/10.1016/j.patcog.2019.01.025
