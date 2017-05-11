function [new_a1, new_vel1, new_a2, new_vel2] = ball_bounce(x1, y1, vel1, a1, x2, y2, vel2, a2, dt)
    ball_size = 5.08;
    ball_friction = 0.08;
    new_a1 = a1;
    new_vel1 = vel1;
    new_a2 = a2;
    new_vel2 = vel2;
    
    [next_x1, next_y1] = move(x1, y1, vel1, a1);
    [next_x2, next_y2] = move(x2, y2, vel2, a2);
    
    m1 = 10;
    m2 = 10;

    dist = sqrt((x1 - x2)^2 + (y1 - y2)^2);
    % collision condition && balls're getting closer to each other
    if dist <= ball_size && ...
            sqrt((next_x1 - next_x2)^2 + (next_y1 - next_y2)^2) < dist
        touch_x = (x1 + x2) / 2;
        touch_y = (y1 + y2) / 2;
        
        if x1 >= x2 && y1 >= y2
            % first quarter
            angle = -1 * asin(abs(y1 - touch_y) / (dist/2)) * 180/pi;
        elseif x1 <= x2 && y1 >= y2
            % second quarter
            angle = asin(abs(y1 - touch_y) / (dist/2)) * 180/pi;
        elseif x1 <= x2 && y1 <= y2
            % third quarter
            angle = -1 * asin(abs(y1 - touch_y) / (dist/2)) * 180/pi;
        elseif x1 >= x2 && y1 <= y2
            % forth quarter
            angle = asin(abs(y1 - touch_y) / (dist/2)) * 180/pi;
        end

        [rotated_next_x1, rotated_next_y1] = rotate(next_x1, next_y1, angle, touch_x, touch_y);
        [rotated_next_x2, rotated_next_y2] = rotate(next_x2, next_y2, angle, touch_x, touch_y);
        [rotated_x1, rotated_y1] = rotate(x1, y1, angle, touch_x, touch_y);
        [rotated_x2, rotated_y2] = rotate(x2, y2, angle, touch_x, touch_y);
        
        v1y = [0, rotated_next_y1 - rotated_y1];
        v1x = [rotated_next_x1 - rotated_x1, 0];
        v2y = [0, rotated_next_y2 - rotated_y2];
        v2x = [rotated_next_x2 - rotated_x2, 0];
        
        u1y = v1y;
        u2y = v2y;
        u1x = ((m1 - m2) * v1x + (m2 + m2) * v2x) / (m1 + m2);
        u2x = ((m1 + m1) * v1x + (m2 - m1) * v2x) / (m1 + m2);
        
        u1 = u1x + u1y;
        u2 = u2x + u2y;
        
        t1 = [rotated_x1, rotated_y1] + u1;
        next_rotated_x1 = t1(1);
        next_rotated_y1 = t1(2);
        
        t2 = [rotated_x2, rotated_y2] + u2;
        next_rotated_x2 = t2(1);
        next_rotated_y2 = t2(2);
        
        [next_x1, next_y1] = rotate(next_rotated_x1, next_rotated_y1, -1 * angle, touch_x, touch_y);
        [next_x2, next_y2] = rotate(next_rotated_x2, next_rotated_y2, -1 * angle, touch_x, touch_y);
        
        new_a1 = vector_to_angle([next_x1 - x1, next_y1 - y1]);
        new_vel1 = sqrt(u1x(1)^2 + u1y(2)^2);
        new_a2 = vector_to_angle([next_x2 - x2, next_y2 - y2]);
        new_vel2 = sqrt(u2x(1)^2 + u2y(2)^2);
        
        new_vel1 = apply_friction(ball_friction, new_vel1, dt);
        new_vel2 = apply_friction(ball_friction, new_vel2, dt);
    end
end

