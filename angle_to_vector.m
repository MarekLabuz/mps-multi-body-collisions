function [x, y] = angle_to_vector(sX, sY, velocity, angle)
    [eX, eY] = move(sX, sY, velocity, angle);
    x = eX - sX;
    y = eY - sY;
end
