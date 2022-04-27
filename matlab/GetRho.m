function [x, rho] = GetRho(q, Q, L)
    q = repmat(q, 1, size(L, 2));
    x = q + (Q * L) ./ (sqrt(dot(L, Q * L, 1)));
    rho = dot(L, x, 1);
end
