clc;
clear;
close all;

fprintf('\n============================================\n');
fprintf('          DRISHTI\n');
fprintf('     SIH26038 END-TO-END DEMO\n');
fprintf('============================================\n\n');

%% 1. LOAD FUNDUS IMAGE

[filename, pathname] = uigetfile( ...
    {'*.jpg;*.jpeg;*.png', 'Fundus Images'}, ...
    'Select Fundus Image');

if isequal(filename, 0)
    fprintf('\nNo image selected. Demo cancelled.\n');
    return;
end

img = imread(fullfile(pathname, filename));

fprintf('[1/5] Fundus image loaded successfully.\n');
fprintf('Selected Image  : %s\n', filename);
%% 2. IMAGE QUALITY GATE

gray = im2double(rgb2gray(img));

laplacianKernel = [0 1 0; 1 -4 1; 0 1 0];
laplacianImage = imfilter(gray, laplacianKernel, 'replicate');

focusScore = var(laplacianImage(:));
brightnessScore = mean(gray(:));

darkPixels = gray < 0.05;
darkRatio = mean(darkPixels(:));

focusOK = focusScore > 0.0001;
brightnessOK = brightnessScore > 0.10 && brightnessScore < 0.90;
fieldOK = darkRatio < 0.50;

% -------- QUALITY FEEDBACK --------

qualityIssues = {};

if ~focusOK
    qualityIssues{end+1} = 'BLURRY IMAGE';
end

if ~brightnessOK
    if brightnessScore <= 0.10
        qualityIssues{end+1} = 'IMAGE TOO DARK';
    elseif brightnessScore >= 0.90
        qualityIssues{end+1} = 'IMAGE TOO BRIGHT';
    end
end

if ~fieldOK
    qualityIssues{end+1} = 'POOR FIELD OF VIEW';
end

qualityOK = isempty(qualityIssues);

fprintf('\n--- IMAGE QUALITY GATE ---\n');
fprintf('Focus Score      : %.5f\n', focusScore);
fprintf('Brightness Score : %.3f\n', brightnessScore);
fprintf('Dark Area Ratio  : %.3f\n', darkRatio);

if ~qualityOK
    fprintf('\nRESULT: IMAGE REJECTED\n');
    fprintf('\nQUALITY ISSUES DETECTED:\n');

    for i = 1:length(qualityIssues)
        fprintf(' - %s\n', qualityIssues{i});
    end

    fprintf('\nRECOMMENDED ACTION:\n');

    if any(contains(qualityIssues, 'BLURRY'))
        fprintf(' - Refocus camera and recapture the image.\n');
    end

    if any(contains(qualityIssues, 'DARK')) || ...
       any(contains(qualityIssues, 'BRIGHT'))
        fprintf(' - Adjust illumination and recapture the image.\n');
    end

    if any(contains(qualityIssues, 'FIELD OF VIEW'))
        fprintf(' - Reposition camera to capture the complete retinal field.\n');
    end

    return;
end

fprintf('RESULT: IMAGE ACCEPTED\n');
%% 3. IMAGE ENHANCEMENT

labImage = rgb2lab(img);

L = labImage(:,:,1) / 100;

L_enhanced = adapthisteq(L, ...
    'ClipLimit', 0.01, ...
    'NumTiles', [8 8]);

labImage(:,:,1) = L_enhanced * 100;

enhancedImg = lab2rgb(labImage);

imwrite(enhancedImg, '../results/enhanced_fundus.png');

fprintf('\n[2/5] Image enhancement completed.\n');

%% 4. PROTOTYPE DR SCREENING

% ICDR grades:
% 0 = No DR
% 1 = Mild NPDR
% 2 = Moderate NPDR
% 3 = Severe NPDR
% 4 = Proliferative DR

DR_grade = 2;

gradeNames = {
    'No Diabetic Retinopathy'
    'Mild Non-Proliferative DR'
    'Moderate Non-Proliferative DR'
    'Severe Non-Proliferative DR'
    'Proliferative DR'
};

classification = gradeNames{DR_grade + 1};

% Demonstration confidence only
confidence = 0.87;

fprintf('\n[3/5] DR screening completed.\n');
fprintf('ICDR Grade       : %d\n', DR_grade);
fprintf('Classification   : %s\n', classification);
fprintf('Confidence       : %.1f%%\n', confidence * 100);

%% 5. EXPLAINABILITY MAP

grayEnhanced = im2double(rgb2gray(enhancedImg));

% -------- PROTOTYPE SUSPECTED EVIDENCE MAPS --------

% Bright-region evidence
brightMap = grayEnhanced > 0.65;
brightMap = bwareaopen(brightMap, 50);
brightMap = imgaussfilt(double(brightMap), 3);
brightMap = mat2gray(brightMap);

% Dark-region evidence
darkMap = grayEnhanced < 0.25;
darkMap = bwareaopen(darkMap, 50);
darkMap = imgaussfilt(double(darkMap), 3);
darkMap = mat2gray(darkMap);

% Local-variation evidence
variationMap = stdfilt(grayEnhanced, ones(7));
variationMap = mat2gray(variationMap);

fprintf('\nPrototype evidence maps generated:\n');
fprintf(' - Bright-region evidence\n');
fprintf(' - Dark-region evidence\n');
fprintf(' - Local-variation evidence\n');

fprintf('\n[4/5] Explainability map generated.\n');

figure;

subplot(2,2,1);
imshow(enhancedImg);
title('Enhanced Fundus');

subplot(2,2,2);
imshow(enhancedImg);
hold on;
imagesc(brightMap, 'AlphaData', brightMap * 0.55);
colormap hot;
colorbar;
title('Bright-Region Evidence');
hold off;

subplot(2,2,3);
imshow(enhancedImg);
hold on;
imagesc(darkMap, 'AlphaData', darkMap * 0.55);
colormap hot;
colorbar;
title('Dark-Region Evidence');
hold off;

subplot(2,2,4);
imshow(enhancedImg);
hold on;
imagesc(variationMap, 'AlphaData', variationMap * 0.55);
colormap hot;
colorbar;
title('Local-Variation Evidence');
hold off;

sgtitle('DRISHTI - Prototype Suspected Evidence Map');

saveas(gcf, '../results/explainability_map.png');
%% 6. GENERATE SCREENING REPORT

reportFile = '../results/DRISHTI_Report.txt';

fileID = fopen(reportFile, 'w');

fprintf(fileID, '============================================\n');
fprintf(fileID, '             DRISHTI\n');
fprintf(fileID, '       Screening Demonstration Report\n');
fprintf(fileID, '============================================\n\n');

fprintf(fileID, 'Patient ID          : DEMO-001\n');
fprintf(fileID, 'Screening Status    : IMAGE ACCEPTED\n');
fprintf(fileID, 'DR Grade (ICDR)     : %d\n', DR_grade);
fprintf(fileID, 'Classification      : %s\n', classification);
fprintf(fileID, 'Prototype Confidence: %.1f%%\n', confidence * 100);

fprintf(fileID, '\n--------------------------------------------\n');
fprintf(fileID, 'IMAGE QUALITY\n');
fprintf(fileID, '--------------------------------------------\n');

fprintf(fileID, 'Focus Score        : %.5f\n', focusScore);
fprintf(fileID, 'Brightness Score   : %.3f\n', brightnessScore);
fprintf(fileID, 'Dark Area Ratio    : %.3f\n', darkRatio);

fprintf(fileID, '\n--------------------------------------------\n');
fprintf(fileID, 'EXPLAINABILITY\n');
fprintf(fileID, '--------------------------------------------\n');

fprintf(fileID, 'Prototype evidence analysis completed.\n');
fprintf(fileID, 'Evidence types visualized:\n');
fprintf(fileID, ' - Bright-region evidence\n');
fprintf(fileID, ' - Dark-region evidence\n');
fprintf(fileID, ' - Local-variation evidence\n');
fprintf(fileID, 'Evidence map: explainability_map.png\n');

fprintf(fileID, '\n--------------------------------------------\n');
fprintf(fileID, 'RECOMMENDATION\n');
fprintf(fileID, '--------------------------------------------\n');

if DR_grade == 0
    fprintf(fileID, 'Routine screening recommended.\n');
elseif DR_grade <= 2
    fprintf(fileID, 'Clinical review recommended based on screening result.\n');
else
    fprintf(fileID, 'Referral for ophthalmic evaluation recommended.\n');
end

fprintf(fileID, '\n============================================\n');
fprintf(fileID, 'SIH26038 Prototype Demonstration\n');
fprintf(fileID, 'Not intended for clinical diagnosis.\n');
fprintf(fileID, '============================================\n');

fclose(fileID);

fprintf('\n[5/5] Screening report generated.\n');

%% FINAL SUMMARY

fprintf('\n============================================\n');
fprintf('          DEMO COMPLETED SUCCESSFULLY\n');
fprintf('============================================\n');

fprintf('Image Quality    : ACCEPTED\n');
fprintf('DR Grade         : %d\n', DR_grade);
fprintf('Classification    : %s\n', classification);
fprintf('Confidence        : %.1f%%\n', confidence * 100);

fprintf('\nGenerated files:\n');
fprintf('1. enhanced_fundus.png\n');
fprintf('2. explainability_map.png\n');
fprintf('3. RETINAWISE_AI_Report.txt\n');

fprintf('\nPrototype note: DR classification and confidence\n');
fprintf('are currently demonstration values, not a trained\n');
fprintf('clinical AI model.\n');

fprintf('============================================\n');
fprintf('\n');
fprintf('============================================\n');
fprintf('             DRISHTI STATUS\n');
fprintf('============================================\n');
fprintf('Quality Gate      : PASS\n');
fprintf('Screening         : COMPLETED\n');
fprintf('Explainability    : GENERATED\n');
fprintf('Report            : GENERATED\n');
fprintf('Capacity Model    : SIMULATED\n');
fprintf('============================================\n');