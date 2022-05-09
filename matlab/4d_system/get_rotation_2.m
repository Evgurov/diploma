function R = get_rotation_2(x, y)
    angle = acos(dot(x,y) / (norm(x) * norm(y)));
    R = [cos(angle), -sin(angle);
         sin(angle), cos(angle)];
end

