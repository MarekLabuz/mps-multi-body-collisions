function new_vel = apply_friction(u, vel, dt)
    m = 1;
    g = 9.81;
    T = u * g;
    a = T/m * 100 * dt^2;
    if vel - a <= 0
        new_vel = 0;
    else
        new_vel = vel - a;
    end
end

