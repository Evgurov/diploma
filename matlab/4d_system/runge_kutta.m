function X = runge_kutta(T, F, X0)
    X = zeros(size(X0, 1), size(X0, 2), size(T, 2));
    X(:, :, 1) = X0;
    for i = 1 : size(T, 2) - 1
        h = abs(T(i + 1) - T(i));
        Xi = X(:, :, i);
        K0 = h * F(T(i), Xi);
        K1 = h * F(T(i) - h/2, Xi - K0/2);
        K2 = h * F(T(i) - h/2, Xi - K1/2);
        K3 = h * F(T(i) - h, Xi - K2);
        X(:, :, i + 1) = Xi - 1/6 * (K0 + 2*K1 + 2*K2 + K3);
    end
end
