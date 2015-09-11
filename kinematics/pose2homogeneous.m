function [g] = pose2homogeneous(x)

    if any(size(x) ~= [7 1])
        error('pose2homogeneous: x must be a 7x1 vector')
    end

    g = eye(4);
    
    g(1:3, 1:3) = quat2rot(x(4:7));
    g(1:3, 4) = x(1:3);

end