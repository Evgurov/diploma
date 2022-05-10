function x = dif_center(T, f, x0)
    x = zeros(size(x0,1), size(T, 2));
    x(:, 1) = x0;
    for i = 1 : size(T,2) - 1
        h = abs(T(i + 1) - T(i));
        xi = x(:, i);
        x(:, i + 1) = xi - h * f(T(i), xi);
    end
end

