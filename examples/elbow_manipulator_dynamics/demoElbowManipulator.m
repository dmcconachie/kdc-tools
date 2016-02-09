clc; clear;
addpath([pwd '/animate'])
addpath([pwd '/kinematics'])
addpath([pwd '/dynamics'])
%% Create the arm
[twists, g_ee_zero, g_li_zero] = createElbowManipulator();
[masses, inertia_matrices] = createElbowInertiaMatrices();

% create some theta, theta_dot variables
[theta, theta_dot] = createJointVariables(size(twists, 2));

%% Part 1: Find the mass matrix
M = computeMassMatrix(twists, theta, g_li_zero, inertia_matrices);

%% Part 2: Find the Coriolis matrix
C = computeCoriolisMatrix(M, theta, theta_dot);

%% Part 3: Find the Gravity vector
N = computeGravityVector(twists, theta, g_li_zero, masses);