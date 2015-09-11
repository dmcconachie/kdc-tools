function [ J ] = linkJacobian(twists, theta, g_li_zero)

    n = length(theta);
    J = zeros(6,n,n);
    
    if isa(twists, 'sym') || isa(theta, 'sym') || isa(g_li_zero, 'sym')
        J = sym(J);
    end
    
    % find the transforms that each joint applies
    g = expTwist(twists, theta);
    
    % calculate the jacbian for each link
    for i = 1:n
        % J_li = [ xi_dagger_1, ... xi_dagger_i, 0 ... 0]
        for j = 1:i
            % xi_dagger_j = adj_inv of transform from joint_j to joint_i  of link_i times twist_j
            J(:,j,i) = adj(g(:,:,j) \ g(:,:,i) * g_li_zero(:,:,i)) \ twists(:,j);
        end
    end
    
    if isa(J, 'sym')
        J = simplify(J);
    end

end

