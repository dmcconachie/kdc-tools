function [ xi ] = generateVelocityPryia( gd,gs, dt )
%Given current pose xs and desired pose xd, generate the velocity

dt = 1;

if length(gs) == 7
    [Rs,ps]=config2homog(gs);
    
    gs=[Rs        ,ps;
    zeros(1,3),  1];
end

if length(gd) == 7
    [Rd,pd]=config2homog(gd);

    gd=[Rd        ,pd;
        zeros(1,3),  1];
end

Rs = gs(1:3, 1:3);
ps = gs(1:3, 4);

Ad=[Rs,skew(ps)*Rs;
    zeros(3,3),Rs];

xi=logm(gs\gd)/dt;
xi=real(xi);
v(1:3)=xi(1:3,4);
w(1:3)=[xi(3,2),xi(1,3),xi(2,1)];
xi=Ad*[v,w]';

end

