clc, clear
%%
l = [1.2;1];
% q1 = [0;0];
% q2 = [pi/2;0];
% q3 = [pi;pi/2];

% q1 = [0; 0.34];
% q2 = [0; -0.34];
% q3 = [0; 1];

q = [130 * pi / 180; -95 * pi / 180];
qp = [5 * pi / 180; -7 * pi / 180];

v = predkosci(l,q,qp);
trajektoria = [];
steps_in_seconds = 10;
while 1
    v = predkosci(l,q,qp);
    p = proste(l, q);
    trajektoria = [trajektoria, p];
    plot(trajektoria(1,:), trajektoria(2,:))
    hold on
    plot([0 cos(q(1))*l(1)], [0 sin(q(1))*l(1)], 'LineWidth', 2)
    hold on
    plot([cos(q(1))*l(1), p(1)], [sin(q(1))*l(1), p(2)], 'LineWidth', 2)
    alfa = atan2(v(1), v(2));
    plot([p(1), p(1) + cos(alfa) * 1], [p(2), p(2) + sin(alfa) * 1], 'Color', 'g')
    xlim([-2.5, 2.5])
    ylim([-2.5, 2.5])
    drawnow 
    hold off
    q = q + qp / steps_in_seconds;
%     if q(1) > pi || q(1) < 0 || q(2) < -135 * pi / 180 || q(2) > 135 * pi /180;
%         break
%     end
end
% 
% p1 = proste(l, q1);
% p2 = proste(l, q2);
% p3 = proste(l, q3);
% 
% [q1a, q1b] = odwrotne(l, p1)
% [q2a, q2b] = odwrotne(l, p2)
% [q3a, q3b] = odwrotne(l, p3)