function plot_tube(x0, v, p, P, q, Q, T, B, C)
    n = 20;
    dim = size(x0, 1);
    L = get_l(n);
    x_op = zeros(dim, size(L, 2), length(T));
    for i = 1 : length(T)
        [x_op(:, :, i), ~] = get_rho(q(:, i), Q(:, :, i), L);
    end
    
    first = figure('Name', "First");
    second = figure('Name', "Second");
    ax_1 = axes(first);
    ax_2 = axes(second);

    
    i = 1;
    x_op_first = [x_op(1, :, i); x_op(2, :, i)];
    x_op_second = [x_op(3, :, i); x_op(4, :, i)];
    x_op_first_proj = x_op_first(:, convhull(x_op_first'));
    x_op_second_proj = x_op_second(:, convhull(x_op_second'));
    x_op_first_proj(3, :) = T(i);
    x_op_second_proj(3, :) = T(i);
    plot3(ax_1, x_op_first_proj(1, :), x_op_first_proj(2, :), x_op_first_proj(3, :), 'color', 'b', 'LineWidth', 2);
    plot3(ax_2, x_op_second_proj(1, :), x_op_second_proj(2, :), x_op_second_proj(3, :), 'color', 'b', 'LineWidth', 2);
    hold(ax_1, 'on');
    hold(ax_2, 'on');
    for i = 2 : 20 : length(T) - 1
        x_op_first = [x_op(1, :, i); x_op(2, :, i)];
        x_op_second = [x_op(3, :, i); x_op(4, :, i)];
        x_op_first_proj = x_op_first(:, convhull(x_op_first'));
        x_op_second_proj = x_op_second(:, convhull(x_op_second'));
        x_op_first_proj(3, :) = T(i);
        x_op_second_proj(3, :) = T(i);
        plot3(ax_1, x_op_first_proj(1, :), x_op_first_proj(2, :), x_op_first_proj(3, :), 'color', 'r');
        plot3(ax_2, x_op_second_proj(1, :), x_op_second_proj(2, :), x_op_second_proj(3, :), 'color', 'r');
    end
    i = length(T);
    x_op_first = [x_op(1, :, i); x_op(2, :, i)];
    x_op_second = [x_op(3, :, i); x_op(4, :, i)];
    x_op_first_proj = x_op_first(:, convhull(x_op_first'));
    x_op_second_proj = x_op_second(:, convhull(x_op_second'));
    x_op_first_proj(3, :) = T(i);
    x_op_second_proj(3, :) = T(i);
    plot3(ax_1, x_op_first_proj(1, :), x_op_first_proj(2, :), x_op_first_proj(3, :), 'color', 'b', 'LineWidth', 2);
    plot3(ax_2, x_op_second_proj(1, :), x_op_second_proj(2, :), x_op_second_proj(3, :), 'color', 'b', 'LineWidth', 2);
    
    ax_1.XLabel.String = 'x1';
    ax_1.YLabel.String = 'x2';
    ax_1.ZLabel.String = 't';
%    ax_1.DataAspectRatio = [1 1 1];
    
    ax_2.XLabel.String = 'x3';
    ax_2.YLabel.String = 'x4';
    ax_2.ZLabel.String = 't';
%    ax_2.DataAspectRatio = [1 1 1];
    
    x = solve_system(x0, flip(T, 2), v, flip(q, 3), flip(Q, 3), p, P, B, C);
    
    x(dim + 1, :) = flip(T, 2);
    plot3(ax_1, x(1,:), x(2, :), x(5,:), 'Color', 'b', 'LineWidth', 2);
    plot3(ax_2, x(3,:), x(4, :), x(5,:), 'Color', 'b', 'LineWidth', 2);
    
    hold(ax_1, 'off');
    hold(ax_2, 'off');
end

