function R = expmExact(w_hat, theta)
    if any(size(w_hat) ~= [3, 3])
        error('expmExact: this function only works for 3x3 matrices');
    end
    
    if norm(unskew(w_hat)) ~= 1
        error('expmExact: this function only works for w with norm 1');
    end
    
    R = eye(3) + w_hat * sin(theta) + w_hat^2*(1-cos(theta));
end