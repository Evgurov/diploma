function X = dif_matr(T, F, X0, l_0, A, B, C, Q, P)
    X = zeros(size(X0, 1), size(X0, 2), size(T, 2));
    X(:, :, 1) = X0;
    l = zeros(size(l_0, 1), size(T, 2));
    l(:, 1) = l_0;
    for i = 1 : size(T, 2) - 1
        h = abs(T(i + 1) - T(i));
        Xi = X(:, :, i);
        l_i = l(:, i);
        Pi = dot(l_i, C(T(i)) * Q(T(i)) * C(T(i))' * l_i)^(1/2) / dot(l_i, Xi * l_i)^(1/2);
        v = (B(T(i)) * P(T(i)) * B(T(i))')^(1/2) * l_i;
        w = dot(l_i, B(T(i)) * P(T(i)) * B(T(i))' * l_i)^(1/2) / dot(l_i, Xi * l_i)^(1/2) * (Xi)^(1/2) * l_i;
        H = get_H_svd(v,w);
%         disp('v:');
%         disp(v);
%         disp('w:');
%         disp(w);
%         disp('Hv:');
%         disp(H * v);
        X(:, :, i + 1) = Xi - h * F(T(i), Xi, Pi, H);
        l(:, i+1) = l_i - h * (-A(T(i))' * l_i);
    end
end

