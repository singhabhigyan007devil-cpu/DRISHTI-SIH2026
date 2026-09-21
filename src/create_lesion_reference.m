clc;
clear;
close all;

% Create a generic lesion-like reference visualization
img = zeros(400, 400, 3);

% Dark retinal background
[X,Y] = meshgrid(1:400,1:400);
cx = 200;
cy = 200;
r = sqrt((X-cx).^2 + (Y-cy).^2);

retina = r < 185;

% Base retinal texture
texture = 0.15 + 0.08 * rand(400,400);

for c = 1:3
    img(:,:,c) = texture;
end

% Add reddish retinal appearance
img(:,:,1) = img(:,:,1) + 0.35;
img(:,:,2) = img(:,:,2) + 0.08;

% Outside retina
for c = 1:3
    temp = img(:,:,c);
    temp(~retina) = 0;
    img(:,:,c) = temp;
end

% Add several localized bright lesion-like regions
lesion1 = ((X-145).^2/(18^2) + (Y-155).^2/(10^2)) < 1;
lesion2 = ((X-260).^2/(15^2) + (Y-220).^2/(9^2)) < 1;
lesion3 = ((X-190).^2/(12^2) + (Y-275).^2/(8^2)) < 1;

lesions = lesion1 | lesion2 | lesion3;

img(:,:,1) = img(:,:,1) + 0.65 * lesions;
img(:,:,2) = img(:,:,2) + 0.55 * lesions;
img(:,:,3) = img(:,:,3) + 0.15 * lesions;

% Keep values valid
img = min(max(img,0),1);

% Save reference image
imwrite(img, '../results/lesion_reference.png');

fprintf('Lesion reference image created successfully.\n');