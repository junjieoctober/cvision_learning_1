% For Your Eyes Only
frizzy = imread('data\frizzy.png');
froomer = imread('data\froomer.png');
imshow(frizzy);
imshow(froomer);

% TODO: Find edges in frizzy and froomer images
edge(frizzy(:,:,1),'canny');
figure; 
edge(froomer(:,:,1),'canny');

% TODO: Display common edge pixels