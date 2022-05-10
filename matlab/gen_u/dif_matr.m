function X = dif_matr(T, F, X0, l, B, C, Q, P)
    X = zeros(size(X0, 1), size(X0, 2), size(T, 2));
    X(:, :, 1) = X0;
    for i = 1 : size(T, 2) - 1
        h = abs(T(i + 1) - T(i));
        Xi = X(:, :, i);
        Pi = dot(l, C(T(i)) * Q(T(i)) * C(T(i))' * l)^(1/2) / dot(l, Xi * l)^(1/2);
        v = (B(T(i)) * P(T(i)) * B(T(i))')^(1/2) * l;
        w = dot(l, B(T(i)) * P(T(i)) * B(T(i))' * l)^(1/2) / dot(l, Xi * l)^(1/2) * (Xi)^(1/2) * l;
        H = get_H_svd(v,w);
        X(:, :, i + 1) = Xi - h * F(T(i), Xi, Pi, H);
    end
end

