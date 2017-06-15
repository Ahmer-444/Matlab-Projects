close all
clear
clc
sceneImage = imread('1.jpg');
[c,r,P] = impixel(sceneImage);
rect = [c r];

warped = four_point_transform(sceneImage,rect);
figure;
imshow(warped)







