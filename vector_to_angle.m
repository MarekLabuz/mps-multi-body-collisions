function angle = vector_to_angle(v)
    x = v(1);
    y = v(2);
    
    angle = 0;
    if x >= 0 && y >= 0
        angle = atan(y / x) * 180/pi;
    elseif x <= 0 && y >= 0
        angle = 90 + abs(atan(x / y)) * 180/pi;
    elseif x <= 0 && y <= 0
        angle = 180 + abs(atan(y / x)) * 180/pi;
    elseif x >= 0 && y <= 0
        angle = 270 + abs(atan(x / y)) * 180/pi;
    end
end
