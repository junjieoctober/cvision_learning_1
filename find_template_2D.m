% Find template 2D
% NOTE: Function definition must be the very first piece of code here!
% Test code:
saturn = imread('data\saturn.png');
imshow(saturn);
glyph = saturn(75:165, 400:485);
figure; 
imshow(glyph);

[y x] = find_template_2D_core(glyph, saturn);
disp([y x]); % should be the top-left corner of template in tablet


