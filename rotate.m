function [x, y] = rotate(sX, sY, angle, wX, wY)
rAngle = angle * pi/180.0;
x = (sX - wX) * cos(rAngle) - (sY - wY) * sin(rAngle) + wX;
y = (sX - wX) * sin(rAngle) + (sY - wY) * cos(rAngle) + wY;
end

