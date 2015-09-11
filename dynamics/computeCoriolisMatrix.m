function [ C ] = computeCoriolisMatrix(M, theta, theta_dot)

    if ~(isa(M, 'sym') && isa(theta, 'sym'))
        error('computeCoriolisMatrix: this only works for symbolic matrices');
    end
    
    C = sym(zeros(size(M)));

    for i = 1:size(C, 1)
        for j = 1:size(C, 2)
            % equation 4.23
            for k = 1:length(theta)
                C(i,j) = C(i,j) + (diff(M(i,j), theta(k)) ...
                                +  diff(M(i,k), theta(j)) ...
                                -  diff(M(k,j), theta(i))) * theta_dot(k);
            end
            C(i,j) = C(i,j) / 2;
        end
    end
    
    C = simplify(C);

end