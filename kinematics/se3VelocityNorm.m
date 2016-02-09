function result = se3VelocityNorm( vel, rotation_scale )

    if ~isvector(vel) || length(vel) ~= 6
        error('se3velocitynorm: vel must be a 6x1 or 1x6 vector');
    end

    result = sqrt( sum(vel(1:3).^2) + rotation_scale*sum(vel(4:6).^2) );
    
end

