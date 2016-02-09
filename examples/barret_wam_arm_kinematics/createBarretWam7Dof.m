function [twist, g_zero] = createBarretWam7Dof()
    twist = zeros(6, 7);

    p_zero = zeros(3,1);
    p_zero(1) = 0.75 - 0.14;
    p_zero(2) = 0.5 + 0.22;
    p_zero(3) = 1.0 + 0.346 + 0.910;

    rot_zero = [ 0 -1  0 ;
                 1  0  0 ;
                 0  0  1 ];

    g_zero = [rot_zero p_zero; 0 0 0 1];

    %% determine the twists
    w1 = [0 0 1]';
    q1 = [p_zero(1), p_zero(2), 0]';

    w2 = [-1 0 0]';
    q2 = [p_zero(1), p_zero(2), 1+0.346]';

    w3 = [0 0 1]';
    q3 = [p_zero(1), p_zero(2), 0]';

    w4 = [-1 0 0]';
    q4 = [p_zero(1), p_zero(2)+0.045, 1+0.346+0.55]';

    w5 = [0 0 1]';
    q5 = [p_zero(1), p_zero(2), 0]';

    w6 = [-1 0 0]';
    q6 = [p_zero(1), p_zero(2), 1+0.346+0.85]';

    w7 = [0 0 1]';
    q7 = [p_zero(1), p_zero(2), 0]';

    twist(:, 1) = createTwist(w1, q1);
    twist(:, 2) = createTwist(w2, q2);
    twist(:, 3) = createTwist(w3, q3);
    twist(:, 4) = createTwist(w4, q4);
    twist(:, 5) = createTwist(w5, q5);
    twist(:, 6) = createTwist(w6, q6);
    twist(:, 7) = createTwist(w7, q7);
end