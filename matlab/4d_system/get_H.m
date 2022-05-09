function H = get_H(v, w)
    u = (v - w)/norm(v - w);
    H = eye(size(v,1)) - 2 * u * u';
end

