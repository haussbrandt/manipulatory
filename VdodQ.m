function dQ = VdodQ(l, V, q)
J = [-l(1) * sin(q(1)) - l(2) * sin(q(1) + q(2)), -l(2)*sin(q(1) + q(2));
     l(1)*cos(q(1)) + l(2) * cos(q(1) + q(2)), l(2) * cos(q(1) + q(2))];

 dQ = inv(J) * V;
end

