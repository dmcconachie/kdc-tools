function R = expmExact(w_hat, theta)
    if size(w_hat) ~= [3, 3]
        error('expmExact: this function only works for 3x3 matrices');
    end
    
    R = eye(3) + w_hat * sin(theta) + w_hat^2*(1-cos(theta));
end