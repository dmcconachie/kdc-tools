% ------------------------
% author: Weikun Zhen    
%   date: Dec 6, 2014    
% ------------------------
% 
% DRAWFRAME: drawFrame draws the x y z axes in a figure with given length.

function [] = drawFrame(g, length)

    if any(size(g) ~= [4 4])
        g = pose2homogeneous(g);
    end

    R = g(1:3, 1:3);
    t = g(1:3, 4);

    o = zeros(3,1);
    x = [length; 0; 0];
    y = [0; length; 0];
    z = [0; 0; length];

    O = R*o+t;
    X = R*x+t;
    Y = R*y+t;
    Z = R*z+t;

    hold on;
    
    plot3([O(1),X(1)],[O(2),X(2)],[O(3),X(3)],'r','linewidth',2);
    plot3([O(1),Y(1)],[O(2),Y(2)],[O(3),Y(3)],'g','linewidth',2);
    plot3([O(1),Z(1)],[O(2),Z(2)],[O(3),Z(3)],'b','linewidth',2);
    
    hold off

end