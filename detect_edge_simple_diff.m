%function 
function im_edge=detect_edge_simple_diff(Y)

[row,col] = size(Y); 

im_edge = ones(size(Y),'uint8'); 

for r = 2 : row-1
    for c = 2:col-1
        a = int16(Y(r,c+1));
        b = int16(Y(r,c-1)); 
        cx = int16(Y(r+1,c));
        d = int16(Y(r-1,c)); 
        
        avg = (a+b+cx+d)/4; 
        %avg = (a+b)/2;
        s = abs(int16(Y(r,c))-avg); 
%         s = mod(s+240,240);
        
        im_edge(r,c) = (s);        
    end
end


max_edge = max(im_edge(:));
min_edge = min(im_edge(:));
s=ones(1,'double'); 
for r = 2 : row-1
    for c = 2:col-1
        s = uint16(im_edge(r,c));
        s = s*225/uint16(max_edge);
        s = max(s,16); 
        im_edge(r,c) = uint8(s); 
    end
end








