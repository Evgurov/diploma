function u = GetU(x, xc, E, p, P)
    if InEllips(x, xc, E)
        u = p;
    else 
        eps = 0.01;
        f = @(lam) dot((eye(2) + lam * E^(-1))^(-1) * (x - xc), E^(-1) * (eye(2) + lam * E^(-1))^(-1)*(x - xc)) - 1;
        lam = 0;
        while f(lam) > 0
            lam = lam + eps;
        end
        s0 = (eye(2) + lam * E^(-1))^(-1) * (x - xc) + xc;
        l0 = (x - s0)/norm(x - s0);
        u = p - P * l0 * (dot(l0, P*l0))^(1/2);
    end
end

