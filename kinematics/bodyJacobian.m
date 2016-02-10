function J_b = bodyJacobian(twists, theta, g_current)
    J_s = spatialJacobian(twists, theta);
    
    J_b = adj(g_current) \ J_s;
end