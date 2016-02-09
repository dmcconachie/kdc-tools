function [transforms] = expTwist(twist, theta)
    if ~isvector(theta)
        error('expTwist: theta must be a scalar or a vector');
    end
    
    n = length(theta);
    
    if any(size(twist) ~= [6 n])
        error('expTwist: twist must be a 6xn matrix');
    end
    
    transforms = zeros(4,4,n);
    g = eye(4);
    
    % if we are working symbolicly, then do so.
    if isa(twist, 'sym') || isa(theta, 'sym')
        g = sym(g);
        transforms = sym(transforms);
    end

    for i = 1:n
        v = twist(1:3, i);
        w = twist(4:6, i);
        
        if all(w == [0; 0; 0])
            gi = [eye(3), v; 0 0 0 1];
        else
            if norm(w) ~= 1
                theta = theta * norm(w);
                v = v / norm(w);
                w = w / norm(w);
            end
            w_hat = skew(w);
            gi = [expmExact(w_hat, theta(i)) , (eye(3) - expmExact(w_hat, theta(i))) * cross(w, v) + w*w'*v*theta(i); 0 0 0 1];
        end
        
        g = g*gi;
        transforms(:,:,i) = g;
    end
    
    if isa(transforms, 'sym')
        transforms = simplify(transforms);
    end
end