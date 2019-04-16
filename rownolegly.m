l = [1; 2];

dx = 1;
dy = 3;

%center at (0,0,0)

hold on
q  = [45;
      45;
      45;
      45;
      45;
      45];
  
dq = 1;
while 1
    base = [-dx, -dy, 0;
            dx, -dy, 0;
            dy*cosd(30) + dx*sind(30), dy*sind(30) - dx*cosd(30), 0;
            dy*cosd(30) - dx*sind(30), dy*sind(30) + dx*cosd(30), 0;
            -dy*cosd(30) + dx*sind(30), dy*sind(30) + dx*cosd(30), 0;
            -dy*cosd(30) - dx*sind(30), dy*sind(30) - dx*cosd(30), 0];

    color = [0.5; 0.5; 0.5; 0.5; 0.5; 0.5];
    fill3(base(:,1), base(:, 2), base(:, 3), color)
    hold on
    
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
        plot3([base(i,1), base(i,1) + ends(i,1)], [base(i, 2),base(i, 2) + ends(i, 2)], [base(i, 3), base(i, 3) + ends(i, 3)])
    end
    xlim([-5, 5])
    ylim([-5, 5])
    zlim([0, 3])
    %view()
    drawnow
    hold off
    
    if (q > 80) | (q < 10)
        dq = dq * -1;
    end
    q = q + dq;
    q
end