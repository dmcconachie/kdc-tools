function [x] = homogeneous2pose(g)

    if any(size(g) ~= [4 4])
        error('homogeneous2pose: g must be a 4x4 matrix')
    end

    x = [g(1:3, 4); rot2quat(g(1:3, 1:3))];

end