function M = computeMassMatrix(twists, theta, g_li_zero, inertia_matrices)

    %% Find the Jacbians for each link
    
    % this is a body jacobian for body frame of each individual link
    J = linkJacobian(twists, theta, g_li_zero);
    
    %% Add up the mass matrices for each link
    M = zeros(3,3);
    
    if isa(inertia_matrices, 'sym') || isa(J, 'sym')
        M = sym(M);
    end

    % equation 4.19
    for i = 1:length(theta);
        M = M + J(:,:,i)' * inertia_matrices(:,:,i) * J(:,:,i);
    end

    if isa(M, 'sym')
        M = simplify(M);
    end

end