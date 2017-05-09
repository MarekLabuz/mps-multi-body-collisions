function [x, y] = move(startX, startY, velocity, angle)
rX = startX + velocity;
rY = startY;
[x, y] = rotate(rX, rY, angle, startX, startY);
end

