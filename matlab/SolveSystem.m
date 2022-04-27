function x = SolveSystem(x0, T, v, xc, E, p, P)
    x = zeros(size(x0, 1), size(T, 2));
    F = @(t, u) u + v(t);
    x(:, 1) = x0;
    for i = 1 : length(T) - 1
        h = abs(T(i + 1) - T(i));
        x(:, i + 1) = x(:, i) + h * F(T(i), GetU(x(:, i), xc(:, i), E(:, :, i), p(T(i)), P(T(i))));
    end
end