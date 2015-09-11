function w = quat2axis(q)
    if length(q) ~= 4
        error('quat2axis: q must be a 4 long vector');
    end

    q_vec = q(1:3);
    q_0 = q(4);
    
    w = zeros(3,1);
    
    if q_0 ~= 0
        theta = 2*acos(q_0);
        w = q_vec / sin(theta/2);
    end    
end