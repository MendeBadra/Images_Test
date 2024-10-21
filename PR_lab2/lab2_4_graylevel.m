clc;
clear all;
% Step 1: Read the image
% input_image = imread('kidney.tif');  % Replace with your image path
% output_image = input_image;  % Create a copy to store the result
%
% % Step 2: Define the intensity range for slicing
% A = 150;
% B = 235;
% L = 255;  % Maximum intensity level (assuming 8-bit image)
%
% % Step 3: Perform intensity level slicing
% % Map values between A and B to L, others to 0
% output_image(input_image >= A && input_image <= B) = L;  % Set values in range to max intensity
% output_image(input_image < A | input_image > B) = 0;    % Set values outside range to 0
%
% % Step 4: Write the resulting image to a file
% imwrite(output_image, 'output_image.png');  % Save the result as PNG
%
% % Step 5: Display and save the plot of original and processed images
% figure;
% subplot(1, 2, 1), imshow(input_image), title('Original Image');
% subplot(1, 2, 2), imshow(output_image), title('Intensity Level Sliced Image');
%
% % Save the plot to disk as a PNG
% print('output_plot.png', '-dpng');  % Save the current figure to a file

% Read the original image
img = imread('kidney.tif');  % Replace 'image.png' with the path to your image

% Convert to grayscale if it's not already
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img; % Already grayscale
end

% Define the intensity levels for slicing
lower_bound = 150; % Start of the range
upper_bound = 240; % End of the range

% (b) Apply slicing transformation for the upper end of the gray scale
sliced_img_upper = img_gray; % Initialize a black image
% sliced_img_upper(img_gray >= lower_bound & img_gray <= upper_bound) = 255; % Highlight the upper range
sliced_img_upper(img_gray <= 120) = 0;

sliced_img_preserve = zeros(size(img_gray));
% (c) Apply slicing transformation to set selected area to black, preserving other grays
sliced_img_preserve(img_gray >= lower_bound & img_gray <= upper_bound) = 255; % Start with the original image
sliced_img_preserve(img_gray < lower_bound | img_gray > upper_bound) = 0; % Set outside range to black

% Plotting the results
figure;
subplot(1, 3, 1);
imshow(img_gray);
title('(a) Aortic Angiogram');

subplot(1, 3, 2);
imshow(sliced_img_upper, []);
title('(b) Upper Gray Scale Slicing');

subplot(1, 3, 3);
imshow(sliced_img_preserve, []);
title('(c) Grays Preserved');

% Save the figure
print('angiogram_transformations', '-dpng');

