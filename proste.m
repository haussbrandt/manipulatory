function p = proste(l, q)
p1 = l(1)*cos(q(1)) + l(2) * cos(q(1)+q(2));
p2 = l(1)*sin(q(1)) + l(2) * sin(q(1)+q(2));
p = [p1;p2];
end