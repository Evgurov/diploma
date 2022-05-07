function plot_tube(x0, v, p, P, q, Q, T)
    n = 100;
    L = get_l(n);
    x_op = zeros(2, n, length(T));
    for i = 1 : length(T)
        [x_op(:, :, i), ~] = get_rho(q(:, i), Q(:, :, i), L);
    end
    for i = 1 : length(T)
        x_op(3, :, i) = T(i);
    end
    i = 1;
    plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'b', 'LineWidth', 2);
    hold on;
    for i = 2 : 20 : length(T) - 1
        plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'r');
    end
    i = length(T);
    plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'b', 'LineWidth', 2);
    
    x = solve_system(x0, flip(T, 2), v, flip(q, 3), flip(Q, 3), p, P);
    
    x(3, :) = flip(T, 2);
    plot3(x(1,:), x(2, :), x(3,:), 'Color', 'b', 'LineWidth', 2);
    
    hold off;
    axis equal;
    xlabel('n_1');
    ylabel('n_2');
    zlabel('t');
    grid on
end

