clc; clear;

A = @(t) [0 1; -2 -1];

p = @(t) [0 0]';
P = @(t) (sin(4 * t) + 2) * [1 0; 0 1];

q = @(t) [0 0]';
Q = @(t) (cos(4 * t) + 2) * [1 0; 0 1];

m = [0 0]';
M = [1 0; 0 1];

v = @(t) [1; 1];

F = @(t, X, Pi, H) A(t) * X + X * A(t)' - X^(1/2) * H * P(t)^(1/2) - P(t)^(1/2) * H' * X^(1/2) + Pi * X + 1/Pi * Q(t);

f = @(t, x) A(t) * x + p(t) + q(t);

T = linspace(4, 0, 1000);

l_0 = [1; 1];

Qt = dif_matr(T, F, M, l_0, A, Q, P);

qt = dif_center(T, f, m);

x0 = [0 0]';
v = @(t) [sin(t); cos(t)];

plot_tube(x0, v, p, P, qt, Qt, T);