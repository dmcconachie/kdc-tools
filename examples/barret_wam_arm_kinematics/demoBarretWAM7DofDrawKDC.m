clc; clear;
addpath([pwd '/animate'])
addpath([pwd '/kinematics'])
addpath([pwd '/dynamics'])
%% Setup the world
% create the robot
[twists, g_zero] = createBarretWam7Dof();

% marker is 12 cm past the end of the tool mount (positive z in tool frame)
p_t = [0 0 0.12 1]';

%% implement the trajectory
traj = load('kdc_joint_angles.txt');
marker = zeros(size(traj, 1), 4);
for i = 1:size(traj, 1)
    g_theta = expTwist(twists, traj(i,:));
    marker(i, :) = g_theta(:,:,end) * g_zero * p_t;
end

%% Draw the resulting trajectory
fig = figure(1); clf( fig );
plot3(marker(:, 1), marker(:, 2), marker(:, 3), '.')
xlabel('x'); ylabel('y'); zlabel('z')