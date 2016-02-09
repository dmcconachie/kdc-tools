clc; clear;
addpath([pwd '/animate'])
addpath([pwd '/kinematics'])
addpath([pwd '/dynamics'])
%% Setup the world
% create the robot
[twists, g_zero] = createBarretWam7Dof();
% Marker is 0.12 cm past the end of the tool mount (positive z in tool frame)
% which is what we actually want to control, so move g_zero
p_t = [0 0 0.12 1]';
g_zero = g_zero * [[eye(3); 0 0 0], p_t];

%% Setup the initial configuration of the arm
theta_start = (0.1:0.1:0.7)';
g_theta = expTwist(twists, theta_start);
g_start = g_theta(:,:,end) * g_zero;

%% Use feedback control style IK to find the correct joint angles at the target
Kp = [eye(3) zeros(3); zeros(3) 0.1*eye(3)];
row_select = [true, true, true, true, true, true];
dt = 0.01;
damping = 0.01;

theta = theta_start;
g_current = g_start;
g_desired = pose2homogeneous([0.49796, 0.98500, 2.34041, -0.11698, 0.07755, 0.82524, 0.54706]');
% g_desired = pose2homogeneous([0.46320, 1.16402, 2.22058, -0.29301, 0.41901, 0.84979, 0.12817]');
e = calculateError(g_desired, g_current);

i = 1;
marker = zeros(1e4, 3);
marker(1, :) = g_start(1:3,4);
while se3VelocityNorm(e, 0.01) > 1e-3 && i < size(marker, 1)
    v_body = Kp*e;
    J_b = bodyJacobian(twists, theta, g_current);
    J_b = J_b(row_select,:);
    v_body = v_body(row_select);
    d_theta = (J_b'/(J_b*J_b' + damping^2*eye(6))) * v_body * dt;
    
    theta = theta + d_theta;
    g_theta = expTwist(twists, theta);
    g_current = g_theta(:,:,end) * g_zero;
    e = calculateError(g_desired, g_current);

    i = i+1;
    marker(i, :) = g_current(1:3,4);
end
marker = marker(1:i-1,:);

%% Plot the resulting marker tip trajectory
fig = figure(1); clf( fig );
plot3(marker(:, 1), marker(:, 2), marker(:, 3), 'b')
drawFrame(g_start, 0.02);
drawFrame(g_desired, 0.01);
drawFrame(g_current, 0.005);