function q = quatMult(q1, q2)
    q = zeros(4,1);
    q(4) = q1(4)*q2(4) - q1(1:3)'*q2(1:3);
    q(1:3) = q1(4)*q2(1:3) + q2(4)*q1(1:3) + cross(q1(1:3), q2(1:3));
end