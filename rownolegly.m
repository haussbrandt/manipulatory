l = [1; 2];

dx = 1;
dy = 3;

% set point
x0 = 0; 
y0 = 0;
z0 = 2;
a = 0;
b = 0;
g = 0;

  
view_angle = 0;
dir = 0.05;
while 1
    %center at (0,0,0)
    base = [-dx, -dy, 0;
            dx, -dy, 0;
            dy*cosd(30) + dx*sind(30), dy*sind(30) - dx*cosd(30), 0;
            dy*cosd(30) - dx*sind(30), dy*sind(30) + dx*cosd(30), 0;
            -dy*cosd(30) + dx*sind(30), dy*sind(30) + dx*cosd(30), 0;
            -dy*cosd(30) - dx*sind(30), dy*sind(30) - dx*cosd(30), 0];
    
    %in relation to base
    plat = platform(a, b, g, x0, y0, z0, dx, dy);
    color = [0.5; 0.5; 0.5; 0.5; 0.5; 0.5];
    fill3(base(:,1), base(:, 2), base(:, 3), color)
    hold on
    q = [];
    for i = 1:6
        xi = plat(i,1);
        yi = plat(i,2);
        zi = plat(i,3);
        
        alfa = atan2d(zi, xi);
        gamma = acosd(((l(1))^2 + xi^2 + zi^2 - (l(2))^2 + yi^2) / (2*l(1) * sqrt(xi^2 + zi^2)));
        
        if mod(i,2) == 0 
            q(i) = pi - gamma - alfa;
        else
            q(i) = -gamma - alfa;
        end
    end
        
    
    for i = 1:6
        lc(i) = l(1) * cosd(q(i));
    end

    ends = [lc(1)*(-sind(30)), lc(1)*(-cosd(30)), l(1) * sind(q(1));
            lc(2)*sind(30), lc(2)*(-cosd(30)), l(1) * sind(q(2));
            lc(3), 0, l(1) * sind(q(3));
            lc(4) * sind(30), lc(4) * cosd(30), l(1) * sind(q(4));
            lc(5) * (-sind(30)), lc(5) * cosd(30), l(1) * sind(q(5));
            -lc(6), 0, l(1) * sind(q(6))];

    for i = 1:6
        plot3([base(i,1), base(i,1) - ends(i,1)], [base(i, 2), base(i, 2) - ends(i, 2)], [base(i, 3), base(i, 3) - ends(i, 3)], 'Color', 'g')
    end
    
    for i = 1:6
        plot3([base(i, 1) - ends(i, 1), base(i,1) + plat(i,1)], [base(i, 2) - ends(i, 2), base(i, 2) + plat(i, 2)], [base(i, 3) - ends(i, 3), base(i, 3) + plat(i, 3)])
    end
    
    fill3(base(:,1)+ plat(:,1), base(:, 2)+ plat(:,2), base(:, 3)+ plat(:,3), color+0.1)
    xlim([-7, 7])
    ylim([-7, 7])
    zlim([-7, 7])
    view(view_angle, 30)   
    %view(2)
    drawnow
    hold off
    
    z0 = z0 + dir;
    if z0 > 2.5 || z0 < 1.5
        dir = dir * -1;
    end
    
    %view_angle = view_angle + 0.1;
end