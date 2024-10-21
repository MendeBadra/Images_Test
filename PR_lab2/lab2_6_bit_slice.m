clc;
clear all;
close all;

pkg load image  % Load the image package

% Read the image
img = imread('dollar.tif');

% Convert the image to grayscale if it's RGB
if size(img, 3) == 3
  img = rgb2gray(img);
end

% Get the size of the image
[rows, cols] = size(img);

subplot(3,3,1), imshow(img);

for i = 1:8
  output = bitget(img, i);
  subplot(3, 3, i+1);
  imshow(logical(output));
end

print("doller_bits.png", "-dpng");