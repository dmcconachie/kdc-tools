function adj = adj(g)
    if any(size(g) ~= [4, 4])
        error ('adjoint: g must be a 4x4 homogeneous transform')
    end
    
    R = g(1:3, 1:3);
    p_hat = skew(g(1:3, 4));
    
    adj = [R         , p_hat*R;
           zeros(3,3), R];
end