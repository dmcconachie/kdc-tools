function w = unskew(w_hat)
    if any(size(w_hat) ~= [3, 3])
        error('unskew: This only works on 3x3 matrics');
    end
    w_hat = (w_hat - w_hat')/2;
    w = [w_hat(3,2); w_hat(1,3); w_hat(2,1)];
end