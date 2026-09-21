clc;
clear;
close all;

% -------- LOAD ENHANCED FUNDUS IMAGE --------

img = imread('../results/enhanced_fundus.png');

% -------- DISPLAY IMAGE --------

figure;
imshow(img);
title('DRISHTI - DR Screening Input');

% -------- PROTOTYPE DR CLASSIFICATION --------
% 0 = No DR
% 1 = Mild
% 2 = Moderate
% 3 = Severe
% 4 = Proliferative DR

% Temporary prototype classification
% This will be replaced by a trained AI model later.

DR_grade = 2;

gradeNames = {
    'No Diabetic Retinopathy'
    'Mild Non-Proliferative DR'
    'Moderate Non-Proliferative DR'
    'Severe Non-Proliferative DR'
    'Proliferative DR'
    };

fprintf('\n========================================\n');
fprintf('       DRISHTI - DR SCREENING\n');
fprintf('========================================\n');

fprintf('Predicted ICDR Grade : %d\n', DR_grade);
fprintf('Classification       : %s\n', gradeNames{DR_grade + 1});

fprintf('========================================\n');