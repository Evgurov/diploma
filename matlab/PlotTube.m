function PlotTube(x0, v, p, P, q, Q, T)
    n = 100;
    L = GetL(n);
    x_op = zeros(2, n, length(T));
    for i = 1 : length(T)
        [x_op(:, :, i), ~] = GetRho(q(:, i), Q(:, :, i), L);
    end
    for i = 1 : length(T)
        x_op(3, :, i) = T(i);
    end
    i = 1;
    plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'b', 'LineWidth', 2);
    hold on;
    for i = 2 : 3 : length(T) - 1
        plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'r');
    end
    i = length(T);
    plot3(x_op(1, :, i), x_op(2, :, i), x_op(3, :, i), 'color', 'b', 'LineWidth', 2);
    
    x = SolveSystem(x0, T, v, q, Q, p, P);
    
    x(3, :) = T;
    plot3(x(1,:), x(2, :), x(3,:), 'LineWidth', 2);
    
    hold off;
    axis equal;
    xlabel('n_1');
    ylabel('n_2');
    zlabel('t');
    grid on
end

