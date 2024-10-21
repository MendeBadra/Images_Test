clc 
clear all
close all

pkg load image;  % Load the image package (if not already loaded)

% Function to perform histogram equalization on an image
function img_eq = hist_equalization(img)
  % Convert to grayscale if the image is RGB
  if ndims(img) == 3
    img = rgb2gray(img);
  end
  
  % Perform histogram equalization
  img_eq = histeq(img);
end

% Paths to the 4 images (replace with actual image paths)
image_files = {
  'image1.tif',
  'image2.tif',
  'image3.tif',
  'image4.tif'
};

% Create a figure for the 4x2 subplot grid
figure;

% Loop through each image, perform histogram equalization, and display them
for i = 1:length(image_files)
  % Read the original image
  img = imread(image_files{i});
  
  % Perform histogram equalization
  img_eq = hist_equalization(img);
  
  % Display original image in the first column
  subplot(4, 2, 2*i-1);
  % subplot('Position', [0.05, 1-0.25*i, 0.4, 0.2]);
  imshow(img);
  title(['Original Image ', num2str(i)]);
  
  % Display equalized image in the second column
  subplot(4, 2, 2*i);
  imshow(img_eq);
  title(['Equalized Image ', num2str(i)]);
end
print("hist_eq.png", "-dpng");
