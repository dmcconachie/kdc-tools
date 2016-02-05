function [theta, theta_dot] = createJointVariables( num_joints )

    theta = sym(zeros(num_joints, 1));
    theta_dot = sym(zeros(num_joints, 1));

    for i = 1:num_joints
        eval(sprintf('syms t%i real;', i));
        eval(sprintf('theta(%i) = t%i;', i, i));

        eval(sprintf('syms t%i_dot real;', i));
        eval(sprintf('theta_dot(%i) = t%i_dot;', i, i));
    end
    
end