function [ q ] = axis2quat( w )

    if length(w) ~= 3
        error('axis2quat: w must be a 3 long vector');
    end
    
    theta = norm(w);
    w = w / theta;
    
    q  = -[w*sin(theta/2); cos(theta/2)];

end

