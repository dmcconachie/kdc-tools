function [xi] = createTwist(omega, q)

    if size(omega) ~= [3, 1]
        error ('createTwist: omega must be a 3x1 vector')
    end
    if size(q) ~= [3, 1]
        error ('createTwist: q must be a 3x1 vector')
    end
    
    if omega == [0 0 0]'
        xi = [q; omega];
    else
        xi = [-cross(omega,q); omega];
    end
  
end