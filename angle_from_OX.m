function angle = angle_from_OX(x, y)
    angle = atan(abs(y) / abs(x)) * 180/pi;
end
