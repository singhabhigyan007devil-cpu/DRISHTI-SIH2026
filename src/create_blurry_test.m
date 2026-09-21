clc;
clear;
close all;

img = imread('../data/good/R.jpg');

% Create deliberately blurry test image
blurredImg = imgaussfilt(img, 8);

% Save to poor-quality folder
imwrite(blurredImg, '../data/poor/blurry_test.jpg');

fprintf('Blurry test image created successfully.\n');