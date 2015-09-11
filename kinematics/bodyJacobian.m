function J_b = bodyJacobian(twists, theta, g_theta)
    J_s = spatialJacobian(twists, theta);
    
    J_b = adj(g_theta) \ J_s;
end