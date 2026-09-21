clc;
clear;
close all;

% Load fundus image
img = imread('../data/good/R.jpg');

% Convert to grayscale
gray = im2double(rgb2gray(img));

% -------- QUALITY METRICS --------

% 1. Focus / sharpness
laplacianKernel = [0 1 0; 1 -4 1; 0 1 0];
laplacianImage = imfilter(gray, laplacianKernel, 'replicate');
focusScore = var(laplacianImage(:));

% 2. Brightness
brightnessScore = mean(gray(:));

% 3. Dark/black area proportion
darkPixels = gray < 0.05;
darkRatio = mean(darkPixels(:));

% -------- QUALITY DECISION --------

focusOK = focusScore > 0.0001;
brightnessOK = brightnessScore > 0.10 && brightnessScore < 0.90;
fieldOK = darkRatio < 0.50;

qualityOK = focusOK && brightnessOK && fieldOK;

% -------- DISPLAY --------

figure;
imshow(img);
title('DRISHTI - Quality Gate');

fprintf('\n========================================\n');
fprintf('       DRISHTI AI - QUALITY GATE\n');
fprintf('========================================\n');

fprintf('Focus Score       : %.5f\n', focusScore);
fprintf('Brightness Score  : %.3f\n', brightnessScore);
fprintf('Dark Area Ratio   : %.3f\n', darkRatio);

if qualityOK
    fprintf('\nRESULT: IMAGE ACCEPTED\n');
    fprintf('Image quality is sufficient for processing.\n');
else
    fprintf('\nRESULT: IMAGE REJECTED\n');
    fprintf('Recapture recommended.\n');
end

fprintf('========================================\n');
% -------- IMAGE ENHANCEMENT --------

labImage = rgb2lab(img);

L = labImage(:,:,1) / 100;

L_enhanced = adapthisteq(L, ...
    'ClipLimit', 0.01, ...
    'NumTiles', [8 8]);

labImage(:,:,1) = L_enhanced * 100;

enhancedImg = lab2rgb(labImage);

figure;

subplot(1,2,1);
imshow(img);
title('Original Fundus');

subplot(1,2,2);
imshow(enhancedImg);
title('CLAHE Enhanced Fundus');
imwrite(enhancedImg, '../results/enhanced_fundus.png');
disp('Enhanced image saved successfully.');