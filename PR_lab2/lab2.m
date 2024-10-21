clc
clear all
close all

%pkg load image

skull_img = imread("skull.tif");

figure;
%imshow(skull_img);

%columns(skull_img)
%rows(skull_img)
size(skull_img)
skull_img_float = double(skull_img);
g_levels = [128, 64, 32, 16, 8, 4, 3, 1];


for i=1:length( g_levels )
  level = g_levels(i);
  subplot(2, 4, i);
  gray_img = floor(skull_img/(256/level)) * (256/level);
  imshow(uint8(gray_img));
end

print("skulls_plots.png", "-dpng")
