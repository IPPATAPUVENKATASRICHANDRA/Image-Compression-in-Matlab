clc
close all
image=imread('nature.png');
image = double(image)/255;
image = rgb2gray(image);
figure(1)
imshow(image)
title('Original image')
figure(2)
imhist(image)
title('Histogram of original image')

img_dct=dct2(image);
img_pow=(img_dct).^2;
img_pow=img_pow(:);
[B,index]=sort(img_pow);%no zig-zag
B=flipud(B);
index=flipud(index);
compressed_dct=zeros(size(image));
coeff = 20000;

% maybe change the value
for k=1:coeff
compressed_dct(index(k))=img_dct(index(k));
end
image_dct=idct2(compressed_dct);

figure(3)
imshow(image_dct)
title('DCT Compress Image')
figure(4)
imhist(image_dct)
title('Histogram of compressed image')