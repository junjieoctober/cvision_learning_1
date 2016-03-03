%first read an image file
%input data to binary stream
im=imread('data/junjie_top.jpg');
sz_im = size(im); 
image(im); 
im_dec = im(:)';
channel_size = sz_im(1)*sz_im(2); 
im_dec(1:2*channel_size) = 0;
%im_dec(channel_size*2+1:end) = 0;
%im_dec(channel_size+1:channel_size*2)
%im_dec = 255-im_dec;
im_dec = reshape(im_dec,size(im)); 
image(im_dec); 
im_bin=dec2bin(im(:))';
im_bin=im_bin(:);

a = ones(sz_im(1),sz_im(2))*128; 

RGB = im;
YCbCr=rgb2ycbcr(RGB); 
Y= YCbCr(:,:,1); 
Yonly = cat(3,Y,a,a); 
% R = RGB(:,:,1); 
% G = RGB(:,:,2); 
% B = RGB(:,:,3); 
% Y = 0.299 * R + 0.587 * G + 0.114 * B; 
% U = -0.14713 * R - 0.28886 * G + 0.436 * B; 
% V = 0.615 * R - 0.51499 * G - 0.10001 * B; 
% YUV = cat(3,Y,U,V); 
imshow(Yonly);



im_bin2=49-uint8(im_bin); 

im_bin=bin2dec(im_bin2); 

im_rec = reshape(im_bin,size(im)); 

imshow(im_rec); 