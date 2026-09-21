clc;
clear;
close all;

% -------- LOAD FUNDUS IMAGE --------

img = imread('../results/enhanced_fundus.png');

% Convert to grayscale
gray = rgb2gray(img);

% -------- CREATE PROTOTYPE LESION MAP --------
% This is a visual demonstration for the SIH prototype.
% It highlights regions with stronger local intensity variation.

gray = im2double(gray);

% Detect local bright structures
brightMap = gray > 0.65;

% Remove very small regions
brightMap = bwareaopen(brightMap, 50);

% Smooth the map
brightMap = imgaussfilt(double(brightMap), 3);

% Normalize
brightMap = mat2gray(brightMap);

% -------- DISPLAY EXPLANATION --------

figure;

subplot(1,2,1);
imshow(img);
title('Enhanced Fundus Image');

subplot(1,2,2);
imshow(img);
hold on;

imagesc(brightMap, 'AlphaData', brightMap * 0.55);
colormap hot;
colorbar;

title('DRISHTI - Explainable Lesion Map');
hold off;

% -------- SAVE RESULT --------

saveas(gcf, '../results/explainability_map.png');

fprintf('\n========================================\n');
fprintf('       DRISHTI - EXPLAINABILITY\n');
fprintf('========================================\n');
fprintf('Lesion visualization generated.\n');
fprintf('Explainability map saved successfully.\n');
fprintf('========================================\n');