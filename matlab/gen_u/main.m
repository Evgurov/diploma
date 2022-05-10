clc; clear;

t0 = 0;
t1 = 4;

A = @(t) [0 1 0 0;
          -1 0 0 0;
          0 0 0 1;
          0 0 -4 0];
      
G = @(t) inv(expm(A(t) * (t1 - t)));

B = @(t) [1 0 0 0;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];
      
B1 = @(t) G(t) * B(t);

C = @(t) [1 0 0 0;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];
  
C1 = @(t) G(t) * C(t);

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

F = @(t, X, Pi, H) - X^(1/2) * H * (B1(t) * P(t) * B1(t)')^(1/2) - (B1(t) * P(t) * B1(t)')^(1/2) * H' * X^(1/2) + Pi * X + 1/Pi * C1(t) * Q(t) * C1(t)';

f = @(t, x) B1(t) * p(t) + C1(t) * q(t);

T = linspace(t1, t0, 1000);

l_0 = [1; 
       1;
       0;
       1];

Qt = dif_matr(T, F, M, l_0, B1, C1, Q, P);

qt = dif_center(T, f, m);

x0 = [-6 8 2 10]';
x01 = G(t0) * x0;
disp("x01:")
disp(x01)

v = @(t) [sin(t); cos(t); cos(t); -8 * sin(t)];

plot_tube(x01, v, p, P, qt, Qt, T, B1, C1);
plot_traj(x01, v, p, P, qt, Qt, T, B1, C1, G); 