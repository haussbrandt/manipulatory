clc, clear

%%
l = [1;1.2];

phi = 0;
while 1
    phi = phi + pi/180;
    px = cos(phi);
    py = 1 + sin(phi);
    [qa, qb] = odwrotne(l, [px;py]);
    plot([0 cos(qa(1))*l(1)], [0 sin(qa(1))*l(1)]) % 1
    hold on
    plot([cos(qa(1))*l(1), px], [sin(qa(1))*l(1), py])
    xlim([-2.5, 2.5])
    ylim([-2.5, 3])
    drawnow 
    hold off
end
