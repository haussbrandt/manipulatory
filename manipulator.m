clc, clear

% długości ramion
l = [1.2;1];


% punkty w układzie kartezjańskim (1 punkt = 1 wiersz)

P = [-1, 1;
    -0.5, 0.5;
    0, 1;
    0.5, 0.5;
    1, 1];
P = P';

% prędkości liniowe w poszczególnych punktach (1 punkt = 1 wiersz)
V = [0, -1;
     1, 0;
     0, 1;
     0, -1;
     0, 1];
V = V';

% czas, w którym końcówka manipulatora znajduje się w poszczególnych
% punktach
tt = [0, 2, 4, 6, 8];

Q = [];

for i = 1:length(P)   
    q = odwrotne(l, P(:,i));
    Q(:,i) = q(:,1);
end

dQ = [];
for i = 1:length(Q)
    dQ(:,i) = VdodQ(l, V(:,i), Q(:,i));
end

a = [];

for i = 1:length(P)-1
    a(:,:,i) = trajektoria(tt(i), tt(i+1), Q(:,i), Q(:,i+1), dQ(:,i), dQ(:,i+1));
end

qt = [];

traj = [];

beta = [];
for i = 1:length(P)
beta(i) = atan2(V(1, i), V(2, i));
end

timestep = 0.05;
current = 1;
for t = 0:timestep:tt(end)
    if (t > tt(current+1))
        current = current + 1;
    end
    q = a(:,1, current) + a(:,2, current) * t + a(:,3, current) * t^2 + a(:,4, current) * t^3;
    qp = a(:,2, current) + 2 * a(:,3, current) * t + 3 * a(:,4, current) * t^2;
    
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
    text(-1,-3, num2str(t))
    
    for i = 1:length(P)
    plot(P(1,i), P(2,i), 'Marker', 'o', 'MarkerEdgeColor', 'k')
    end
    
    for i = 1:length(P)
    plot([P(1,i), P(1, i) + sin(beta(i)) * 1], [P(2, i), P(2, i) + cos(beta(i)) * 1], 'c')
    end
    drawnow
    
    hold off
%     if q(1) > pi || q(1) < 0 || q(2) < -135 * pi / 180 || q(2) > 135 * pi /180;
%         break
%     end
end
t = [0:timestep:tt(end)];
figure(2)
plot(t,180 * qt(1,:) / pi);
hold on
plot(t,180 * qt(2,:) / pi);
