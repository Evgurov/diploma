function u = get_u(x, xc, E, p, P, B)
    if in_ellips(x, xc, E)
        u = p;
    else 
        eps = 0.1;
        f = @(lam) dot((eye(size(E, 1)) + lam * E^(-1))^(-1) * (x - xc), E^(-1) * (eye(size(E,1)) + lam * E^(-1))^(-1)*(x - xc)) - 1;
        lam = 0;
        while f(lam) > 0
            lam = lam + eps;
        end
        s0 = (eye(size(E,1)) + lam * E^(-1))^(-1) * (x - xc) + xc;
        l0 = (x - s0)/norm(x - s0);
        l0 = B' * l0;
        u = p - P * l0 * (dot(l0, P*l0))^(1/2);
    end
%    disp(u);
end

