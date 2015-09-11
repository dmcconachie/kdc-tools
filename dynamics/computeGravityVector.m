function [ N ] = computeGravityVector(twists, theta, g_li_zero, masses)
    
    if ~isa(theta, 'sym')
        error('computeGravityVector: this only works for symbolic matrices');
    end

    n = length(theta);
    
    N = sym(zeros(n, 1));
    V = sym(0);
    syms g real;
    
    % find the transforms each link applies
    g_transform = expTwist(twists, theta);
    
    % find the potential energy of each link
    for i = 1:n
        g_li = g_transform(:,:,i) * g_li_zero(:,:,i);
        V = V + masses(i) * g * g_li(3,4);
    end
    
    % differentiate with respect to each theta_i
    for i = 1:n
        N(i) = diff(V, theta(i));
    end
    
    N = simplify(N);
        
end