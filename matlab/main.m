clc; clear;

p = @(t) [0 0]';
P = @(t) [2*t 0; 0 2];

q = @(t) [0 0]';
Q = @(t) [1 0; 0 1];

m = [0 0]';
M = [1 0; 0 1];

H = @(t) P(t)^(-1/2);

Pi = @(t, X) sqrt(trace(X)) / sqrt(trace(Q(t)));

f = @(t, X) p(t) + q(t);

F = @(t, X) Pi(t, X) * X + Pi(t, X)^(-1) * Q(t) - H(t)^(-1) * ((H(t) * P(t) * H(t)')^(1/2) * (H(t) * X * H(t)')^(1/2) + (H(t) * X * H(t)')^(1/2) * (H(t) * P(t) * H(t)')^(1/2)) * H(t)'^(-1); 

T = linspace(5, 3, 100);

qt = RungeKutta(T, f, m);

Qt = RungeKutta(T, F, M);

x0 = [0 0]';
v = @(t) [sin(t); cos(t)];

PlotTube(x0, v, p, P, qt, Qt, T);





