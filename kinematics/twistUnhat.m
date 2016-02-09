function twist_unhat = twistUnhat(twist_hat)
    if any(size(twist_hat) ~= [4 4])
        error('twistUnat: twist_hat must be a 4x4 matrix');
    end
    
    twist_unhat = [twist_hat(1:3, 4); unskew(twist_hat(1:3, 1:3))];
end