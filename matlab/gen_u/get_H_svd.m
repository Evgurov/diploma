function H = get_H_svd(v, w)
    [U_v, S_v, V_v] = svd(v);
    [U_w, S_w, V_w] = svd(w);
    H = U_w * U_v' * V_w / V_v * S_w(1) / S_v(1);
end

