clc;
clear;
close all;

% -------- SCREENING RESULTS --------

patientID = "DEMO-001";

DR_grade = 2;

gradeNames = {
    'No Diabetic Retinopathy'
    'Mild Non-Proliferative DR'
    'Moderate Non-Proliferative DR'
    'Severe Non-Proliferative DR'
    'Proliferative DR'
    };

classification = gradeNames{DR_grade + 1};

% Prototype confidence
confidence = 0.87;

% -------- GENERATE REPORT --------

reportFile = '../results/RETINAWISE_AI_Report.txt';

fileID = fopen(reportFile, 'w');

fprintf(fileID, '============================================\n');
fprintf(fileID, '           DRISHTI\n');
fprintf(fileID, '   Explainable Diabetic Retinopathy\n');
fprintf(fileID, '          Screening Report\n');
fprintf(fileID, '============================================\n\n');

fprintf(fileID, 'Patient ID          : %s\n', patientID);
fprintf(fileID, 'Screening Status    : IMAGE ACCEPTED\n');
fprintf(fileID, 'DR Grade (ICDR)     : %d\n', DR_grade);
fprintf(fileID, 'Classification      : %s\n', classification);
fprintf(fileID, 'Model Confidence    : %.1f%%\n', confidence * 100);

fprintf(fileID, '\n--------------------------------------------\n');
fprintf(fileID, 'EXPLAINABILITY\n');
fprintf(fileID, '--------------------------------------------\n');
fprintf(fileID, 'Lesion visualization generated.\n');
fprintf(fileID, 'Explainability map: explainability_map.png\n');

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
fprintf(fileID, 'Prototype demonstration - SIH26038\n');
fprintf(fileID, 'Not intended for clinical diagnosis.\n');
fprintf(fileID, '============================================\n');

fclose(fileID);

fprintf('\n========================================\n');
fprintf('       SCREENING REPORT GENERATED\n');
fprintf('========================================\n');
fprintf('Patient ID       : %s\n', patientID);
fprintf('DR Grade         : %d\n', DR_grade);
fprintf('Classification   : %s\n', classification);
fprintf('Confidence       : %.1f%%\n', confidence * 100);
fprintf('Report saved successfully.\n');
fprintf('========================================\n');