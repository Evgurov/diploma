function L = get_l(n)
    alpha_1 = linspace(0, 2 * pi, 2 * n);
    alpha_2 = linspace(-pi/2, pi/2, n);
    alpha_3 = linspace(-pi/2, pi/2, n);
    
    L = zeros(4, 2 * n * n * n);
    
    t = 1;
    for i = 1 : 2 * n
        for j = 1 : n
            for k = 1 : n
                L(1, t) = cos(alpha_1(i)) * cos(alpha_2(j)) * cos(alpha_3(k));
                L(2, t) = sin(alpha_1(i)) * cos(alpha_2(j)) * cos(alpha_3(k));
                L(3, t) = sin(alpha_2(j)) * cos(alpha_3(k));
                L(4, t) = sin(alpha_3(k));
                t = t + 1;
            end
        end
    end
end

