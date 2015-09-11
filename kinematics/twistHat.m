function twist_hat = twistHat(twist)
    if size(twist) ~= [6 1]
        error('twistHat: twist must be a 6x1 vector');
    end
    
    twist_hat = [skew(twist(4:6)), twist(1:3); 0 0 0 0];
end