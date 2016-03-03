% Gradient Direction
function result = select_gdir_core(gmag, gdir, mag_min, angle_low, angle_high)
    % TODO Find and return pixels that fall within the desired mag, angle range
    index = find( (gmag(:) > mag_min) & (gdir(:) < angle_high) & (gdir(:) > angle_low)); 
    [r,c] = ind2sub(size(gdir),index); 
    result = zeros(size(gdir)); 
    result(r,c) = (gdir(r,c)+180)/360.0; 


