function xi = calculateError(g_d, g_c)
% This calculates the twist that brings us from x_c to x_d
% This is a *BODY* velocity
% g_d, and g_c can be in the form of homogeous transforms, or
% [x, y, z, quaternion] representation

    if any(size(g_d) ~= [4 4])
        g_d = pose2homogeneous(g_d);
    end

    if any(size(g_c) ~= [4 4])
        g_c = pose2homogeneous(g_c);
    end
        
    g_error = g_c\g_d;
    
    xi = twistUnhat(real(logm(g_error)));
end

