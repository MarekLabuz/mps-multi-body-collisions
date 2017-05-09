function new_angle = band_bounce(x, y, angle)
width_inner = 112.0;
length_inner = 224.0;
b = [length_inner + 15 width_inner + 15 15 15];
half_ball_size = 5.08/2;

new_angle = angle;
if y + half_ball_size >= b(1)
    new_angle = 360.0 - angle;
elseif x + half_ball_size >= b(2)
    new_angle = 180.0 - angle;
elseif y - half_ball_size <= b(3)
    new_angle = 360.0 - angle;
elseif x - half_ball_size <= b(4)
    new_angle = 180.0 - angle;
end

end