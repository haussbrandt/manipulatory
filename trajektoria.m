function A = trajektoria(t1, Q0, Q1, dQ0, dQ1)
a0 = Q0;
a1 = dQ0;
a2 = (3*Q1 - 3*Q0 - 2 * dQ0*t1 - dQ1 * t1) / (t1^2);
a3 = (dQ0*t1 + dQ1*t1 - 2*Q1 + 2*Q0) / (t1^3);

A = [a0, a1, a2, a3];

end

