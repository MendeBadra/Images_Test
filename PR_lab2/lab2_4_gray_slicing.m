clc
clear all
close all

pkg load image
figure;

img = imread("dollar.tif");
if (size(img, 3)==3)
  input = rgb2gray(img);
else 
  input = img;
end

subplot(3,3,1), imshow(input);
for i = 1:8
  output = bitget(input, i);
  subplot(3,3, i+1);
  imshow(logical(output));
end