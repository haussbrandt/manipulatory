clc, clear
%%
l = [1.2;1];

q1 = [0;0];
q2 = [pi/2;0];
q3 = [pi;pi/2];

p1 = proste(l, q1);
p2 = proste(l, q2);
p3 = proste(l, q3);

[q1a, q1b] = odwrotne(l, p1)
[q2a, q2b] = odwrotne(l, p2)
[q3a, q3b] = odwrotne(l, p3)