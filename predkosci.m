function v = predkosci(l, q, qp)
J = [-l(1) * sin(q(1)) - l(2) * sin(q(1) + q(2)), -l(2)*sin(q(1) + q(2));
     l(1)*cos(q(1)) + l(2) * cos(q(1) + q(2)), l(2) * cos(q(1) + q(2))];
v = J * qp;
end