function [yIndex xIndex] = find_template_2D_core(template, img)
    % TODO: Find template in img and return [y x] location
    % NOTE: Turn off all output from inside the function before submitting!
    img2 = double (img);
    template2 = double (template); 
    mtemp = mean(template2(:)); 
    A = xcorr2(img2-mean(img2(:)),template2-mtemp); 
    [M,I] = max(A(:));
    [row,col] = size(template2); 
    [I_row, I_col] = ind2sub(size(A),I);
    yIndex = I_row - row + 1; 
    xIndex = I_col - col + 1; 
end
