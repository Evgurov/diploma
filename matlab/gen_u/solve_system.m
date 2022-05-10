function x = solve_system(x0, T, v, xc, E, p, P, B, C)
    x = zeros(size(x0, 1), size(T, 2));
    F = @(t, x, u) B(t) * u + C(t) * v(t);
    x(:, 1) = x0;
    for i = 1 : length(T) - 1
        h = abs(T(i + 1) - T(i));
        xi = x(:, i);
        x(:, i + 1) = xi + h * F(T(i), xi, get_u(xi, xc(:, i), E(:, :, i), p(T(i)), P(T(i)), B(T(i))));
    end
end