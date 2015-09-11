function J = spatialJacobian(twists, theta)

    J = zeros(size(twists));

    if isa(twists, 'sym') || isa(theta, 'sym')
        J = sym(J);
    end

    g = expTwist(twists, theta);
    for i = 1:length(theta)
        J(:,i) = adj(g(:,:,i))*twists(:,i);
    end
end