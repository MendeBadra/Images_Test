clc
clear all
close all

pkg load image

img = imread("washed_pollen.png");

if (size(img, 3)==3)
  input = rgb2gray(img);
else 
  input = img;
end

subplot(2,2,1),imshow(input);
[row, col] = size(input);
first = imadjust(input);

subplot(2,2,2), imshow(first);

output = zeros(row,col);

for i = 1:size(first,1)
  for j=1:size(first,2)
    if(first(i,j)>150)
      output(i,j) = 255;
     else
      output(i,j) = 0;
     end
  endfor
end
subplot(2,2,3), imshow(output);

print("pollen_contrast.png", "-dpng")