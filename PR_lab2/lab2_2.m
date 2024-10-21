clc
clear all
close all

pkg load image

rose_img = imread("rose.tif");

figure;
imshow(rose_img)

size(rose_img)

lens = [128, 64, 32];

for i=1:length(lens)
    sz = [lens(i), lens(i)];
    subplot(2, 3, i);
    rose_default = imresize(rose_img, sz, 'nearest');
    rose_default = imresize(rose_default, [1024, 1024], 'nearest');
    imshow(rose_default)
    
    subplot(2, 3, i+3);
    rose_bilinear = imresize(rose_img, sz, 'nearest');
    rose_bilinear = imresize(rose_bilinear, [1024, 1024], 'bilinear');
    imshow(rose_bilinear)
end

print("rose_interpolate_plot.png", "-dpng");
