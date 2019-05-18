function q = odwrotne(l, p)
q11 = atan2(p(2), p(1)) - real(acos((l(1)^2 + (sqrt(p(1)^2 + p(2)^2))^2 - l(2)^2) / (2*l(1) * sqrt(p(1)^2 + p(2)^2))));
q12 = atan2(p(2), p(1)) + real(acos((l(1)^2 + (sqrt(p(1)^2 + p(2)^2))^2 - l(2)^2) / (2*l(1) * sqrt(p(1)^2 + p(2)^2))));

q21 = pi - real(acos((l(2)^2 + l(1)^2 - (sqrt(p(1)^2 + p(2)^2))^2) / (2 * l(1) * l(2))));
q22 = -pi + real(acos((l(2)^2 + l(1)^2 - (sqrt(p(1)^2 + p(2)^2))^2) / (2 * l(1) * l(2))));

qa = [q11;q21];
qb = [q12;q22];
q = [qa,qb];
end