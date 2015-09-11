function [ R,p ] = config2homog( x )
%Transform configuration to rotaion and translation.

p=x(1:3);
R=quat2rot(x(4:7));

end

