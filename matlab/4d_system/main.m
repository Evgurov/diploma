clc; clear;

A = @(t) [0 1 0 0; 
          -1 0 0 0;
          0 0 0 1;
          0 0 -4 0];

B = @(t) [1 0 0 0;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];

C = @(t) [1 0 0 0;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];

p = @(t) [0 0 0 0]';
P = @(t) [9 0 0 0;
          0 1 0 0
          0 0 9 0
          0 0 0 1];
      
q = @(t) [0 0 0 0]';
Q = @(t) [1 0 0 0;
          0 9 0 0
          0 0 1 0
          0 0 0 9];

m = [10 0 0 10]';
M = [100 0 0 0;
     0 100 0 0;
     0 0 100 0;
     0 0 0 100];

F = @(t, X, Pi, H) A(t) * X + X * A(t)' - X^(1/2) * H * (B(t) * P(t) * B(t)')^(1/2) - (B(t) * P(t) * B(t)')^(1/2) * H' * X^(1/2) + Pi * X + 1/Pi * C(t) * Q(t) * C(t)';

f = @(t, x) A(t) * x + B(t) * p(t) + C(t) * q(t);

T = linspace(3, 0, 1000);

l_0 = [1; 
       1;
       1;
       1];

Qt = dif_matr(T, F, M, l_0, A, B, C, Q, P);

qt = dif_center(T, f, m);

x0 = [-10 5 5 5]';
v = @(t) [0; 0; 0; 0];

plot_tube(x0, v, p, P, qt, Qt, T, A, B, C);