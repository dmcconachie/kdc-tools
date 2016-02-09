function [ masses, inertia_matrices ] = createElbowInertiaMatrices()
    syms m1 Ix1 Iy1 Iz1 real;
    syms m2 Ix2 Iy2 Iz2 real;
    syms m3 Ix3 Iy3 Iz3 real;
    
    masses = [m1 m2 m3]';
    
    %% Create each inertia matrix
    % Our link coordinate frames are aligned with the base frame as well as
    % along the principle axes of each link, so the matrices are diagonal
    inertia_matrices = sym(zeros(6,6,3));
    
    inertia_matrices(1:3,1:3,1) = eye(3)*m1;
    inertia_matrices(4:6,4:6,1) = diag([Ix1, Iy1, Iz1]);
    
    inertia_matrices(1:3,1:3,2) = eye(3)*m2;
    inertia_matrices(4:6,4:6,2) = diag([Ix2, Iy2, Iz2]);
    
    inertia_matrices(1:3,1:3,3) = eye(3)*m3;
    inertia_matrices(4:6,4:6,3) = diag([Ix3, Iy3, Iz3]);
end