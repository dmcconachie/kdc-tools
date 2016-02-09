function [ twists, g_ee_zero, g_li_zero  ] = createElbowManipulator()

    syms r0 r1 r2 real;
    syms l0 l1 l2 l3 real;
    syms t1 t2 t3 real;
    
    twists = sym(zeros(6, 3));

    %% set the tool frame starting transformation
    g_ee_zero = sym(eye(4)); % rotation
    g_ee_zero(1,4) = 0; %x
    g_ee_zero(2,4) = l1 + l2; %y
    g_ee_zero(3,4) = l0; %z

    %% set the link center of mass starting transformations
    g_li_zero = sym(zeros(4,4,3));
    
    % link 1
    g_li_zero(:,:,1) = eye(4); % rotation
    g_li_zero(1,4,1) = 0; %x
    g_li_zero(2,4,1) = 0; %y
    g_li_zero(3,4,1) = r0; %z
    
    % link 2
    g_li_zero(:,:,2) = eye(4); % rotation
    g_li_zero(1,4,2) = 0; %x
    g_li_zero(2,4,2) = r1; %y
    g_li_zero(3,4,2) = l0; %z
    
    % link 3
    g_li_zero(:,:,3) = eye(4); % rotation
    g_li_zero(1,4,3) = 0; %x
    g_li_zero(2,4,3) = l1 + r2; %y
    g_li_zero(3,4,3) = l0; %z
    
    %% determine the twists
    w1 = [0 0 1]';
    q1 = [0, 0, 0]';

    w2 = [-1 0 0]';
    q2 = [0, 0, l0]';

    w3 = [-1 0 0]';
    q3 = [0, l1, l0]';

    twists(:, 1) = createTwist(w1, q1);
    twists(:, 2) = createTwist(w2, q2);
    twists(:, 3) = createTwist(w3, q3);
    
end