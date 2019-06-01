function A = trajektoria(t0, t1, Q0, Q1, dQ0, dQ1)
a0 = -(Q0*t1^3 - Q1*t0^3 - dQ0*t0*t1^3 + dQ1*t0^3*t1 + dQ0*t0^2*t1^2 - dQ1*t0^2*t1^2 - 3*Q0*t0*t1^2 + 3*Q1*t0^2*t1)/((t0 - t1)*(t0^2 - 2*t0*t1 + t1^2));
a1 = -(dQ0*t1^3 - dQ1*t0^3 + dQ0*t0*t1^2 - 2*dQ0*t0^2*t1 + 2*dQ1*t0*t1^2 - dQ1*t0^2*t1 + 6*Q0*t0*t1 - 6*Q1*t0*t1)/((t0 - t1)*(t0^2 - 2*t0*t1 + t1^2));
a2 = (3*Q0*t0 + 3*Q0*t1 - 3*Q1*t0 - 3*Q1*t1 - dQ0*t0^2 + 2*dQ0*t1^2 - 2*dQ1*t0^2 + dQ1*t1^2 - dQ0*t0*t1 + dQ1*t0*t1)/((t0 - t1)*(t0^2 - 2*t0*t1 + t1^2));
a3 = -(2*Q0 - 2*Q1 - dQ0*t0 + dQ0*t1 - dQ1*t0 + dQ1*t1)/((t0 - t1)*(t0^2 - 2*t0*t1 + t1^2));

A = [a0, a1, a2, a3];

end

