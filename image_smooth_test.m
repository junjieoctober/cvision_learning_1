function image_smooth_test()

close all; 
im = imread('data\phyllis-diller.jpg'); 
imshow(im); 

figure; 
imgray = rgb2gray(im); 
imshow(imgray); 

sz = size(imgray); 
disp(sz); 

imsmooth = zeros(sz); 
kernelsz = int16(15);
m0       = (kernelsz-1)/2; 
ms = 2*m0+1; 
weights = ones(kernelsz,kernelsz)/double(kernelsz^2); 
for i = ms : sz(1)-(ms)
    for j = ms: sz(2) -(ms)
        for u = 1:kernelsz
            for v = 1:kernelsz
            imsmooth(i,j) = imsmooth(i,j) + weights(u,v)*double(imgray(i-(u-m0),j-(v-m0))); 
            end
        end
        imsmooth(i,j) = imsmooth(i,j) /255; 
    end
end

figure;
imshow(imsmooth); 



