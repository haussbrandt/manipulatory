clc, clear

l = [1.2;1];
P0 = [-1;1];
P1 = [-0.5;0.5];
V0 = [0;1];
V1 = [1;0];
t1 = 20;


Q0 = odwrotne(l,P0);
Q1 = odwrotne(l,P1);

Q0 = Q0(:,1);
Q1 = Q1(:,1);

dQ0 = VdodQ(l, V0, Q0);
dQ1 = VdodQ(l, V1, Q1);

a = trajektoria(t1, Q0, Q1, dQ0, dQ1);
qt = [];

traj = [];
v0 = predkosci(l, Q0, dQ0);
beta = atan2(v0(1), v0(2));
for t = [0:0.1:t1]
    q = a(:,1) + a(:,2) * t + a(:,3) * t^2 + a(:,4) * t^3;
    qp = a(:,2) + 2 * a(:,3) * t + 3 * a(:,4) * t^2;
    
    qt = [qt, q];
    v = predkosci(l, q, qp);
    p = proste(l, q);
    traj = [traj, p];
    figure(1)
    plot(traj(1,:), traj(2,:))
    hold on
    plot([0 cos(q(1))*l(1)], [0 sin(q(1))*l(1)], 'LineWidth', 2)
    hold on
    plot([cos(q(1))*l(1), p(1)], [sin(q(1))*l(1), p(2)], 'LineWidth', 2)
    alfa = atan2(v(1), v(2));
    plot([p(1), p(1) + sin(alfa) * 1], [p(2), p(2) + cos(alfa) * 1], 'Color', 'g')
    xlim([-2.5, 2.5])
    ylim([-2.5, 2.5])
    drawnow
    plot([P0(1), P0(1) + sin(beta) * 1], [P0(2), P0(2) + cos(beta) * 1])
    hold off
%     if q(1) > pi || q(1) < 0 || q(2) < -135 * pi / 180 || q(2) > 135 * pi /180;
%         break
%     end
end
t = [0:0.1:t1];
figure(2)
plot(t,180 * qt(1,:) / pi);
hold on
plot(t,180 * qt(2,:) / pi);
