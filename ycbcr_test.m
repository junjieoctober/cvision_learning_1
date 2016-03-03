 %Clear command window.
clc;

close all; 
    %Clear workspace.
clear;
    %Load image 'Airplane'.
%RGB = imread('data/junjie_top.jpg'); 
RGB = imread('data/amy_clothing.jpg'); 
    %Convert RGB image to YCbCr Components.

% RGB = 0*ones(size(RGB));     
YCbCr = rgb2ycbcr(RGB);
sz = size(YCbCr); 
    %Create a matrix of 0s, 512x512.
a = 128*ones(sz(1),sz(2));
    %Isolate Y. 
Y = YCbCr(:,:,1);



edge_Y = detect_edge_simple_diff(Y); 
    %Isolate Cb. 
Cb = YCbCr(:,:,2);
    %Isolate Cr. 
Cr= YCbCr(:,:,3);
    %Create a YCbCr image with only the Y component.  
just_Y = cat(3, Y, a, a);

just_Y_edge = cat(3,edge_Y,a,a); 
    %Create a YCbCr image with only the Cb component.  
just_Cb = cat(3, a, Cb, a);
    %Create a YCbCr image with only the Cr component.  
just_Cr = cat(3, a, a, Cr);
    %turn back to rgb
YY = ycbcr2rgb(just_Y);
YY_edge = ycbcr2rgb(just_Y_edge); 

CbCb = ycbcr2rgb(just_Cb);
CrCr = ycbcr2rgb(just_Cr);
    %Display the Original Image.  
figure, imshow(RGB), title('Original Image')
    %Display the Y(black and white) Component.
figure, imshow(YY), title('Y Component')
%imwrite(YY,'data/junjie_top_gray.jpg');
imwrite(YY,'data/amy_clothing_gray.jpg');

%Display the Cb Component.
figure, imshow(YY_edge),title('Y edge component'); 

imwrite(YY_edge,'data/amy_clothing_gray_edge.jpg');

figure, imshow(CbCb), title('Cb Component')
     %Display the Cr Component.
figure, imshow(CrCr), title('Cr Component')   
