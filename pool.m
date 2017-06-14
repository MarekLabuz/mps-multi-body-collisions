clc;
close all;

width_outer = 142.0;
length_outer = 254.0;
width_inner = 112.0;
length_inner = 224.0;
ball_size = 5.08;

pocket_size = 22;
pocket_color = [62 22 10];
cloth_color = [2 102 42];
band_color = [162 61 31];
border_color = [116 43 21];

% yellow = [247 202 23];
% blue = [36 116 169];
% red = [239 72 54];
% purple = [143 68 173];
% orange = [249 148 6];
% green = [7 168 132];
% brown = [179 55 64];
% black = [43 43 43];
% white = [242 242 242];

w = 6; % m/s
dt = 0.001; % 1/1000 of second

white_ball_speed = 100 * w * dt;
ball_speed = 0.0;

cloth_friction = 0.05;

balls_names = ['white     '; 'yellow    '; 'blue (/)  '; 'red       '; 'black     '; ...
    'green (/) '; 'purple    '; 'brown (/) '; 'yellow (/)'; 'blue      '; ...
    'red (/)   '; 'brown     '; 'orange (/)'; 'orange    '; 'green     '; 'purple (/)'];

%%
% r, g, b, posX, posY, striped, velocity, angle
balls = [
    242, 242, 242, 15 + width_inner/2, 15 + 1/4 * length_inner - 1/2 * ball_size, 0, white_ball_speed, 89.5;
    % 242, 242, 242, 30.0, 130.0, 0.0, 0.2, 0.0;
    
    247, 202, 23, 15 + width_inner/2, 15 + 3/4 * length_inner, 0, ball_speed, 0;
    % 247, 202, 23, 90.0, 130, 0.0, 0.2, 180.0;
     
    36, 116, 169, 15 + width_inner/2 - 1/2 * ball_size, 14.5 + 3/4 * length_inner + ball_size, 1, ball_speed, 0;
    239, 72, 54, 15 + width_inner/2 + 1/2 * ball_size, 14.5 + 3/4 * length_inner + ball_size, 0, ball_speed, 0;
    
    43, 43, 43, 15 + width_inner/2, 14 + 3/4 * length_inner + 2 * ball_size, 0, ball_speed, 0;
    7, 168, 132, 15 + width_inner/2 + ball_size, 14 + 3/4 * length_inner + 2 * ball_size, 1, ball_speed, 0;
    143, 68, 173, 15 + width_inner/2 - ball_size, 14 + 3/4 * length_inner + 2 * ball_size, 0, ball_speed, 0;
    
    179, 55, 64, 15 + width_inner/2 + 1/2 * ball_size, 13.5 + 3/4 * length_inner + 3 * ball_size, 1, ball_speed, 0;
    247, 202, 23, 15 + width_inner/2 - 1/2 * ball_size, 13.5 + 3/4 * length_inner + 3 * ball_size, 1, ball_speed, 0;
    36, 116, 169, 15 + width_inner/2 + 3/2 * ball_size, 13.5 + 3/4 * length_inner + 3 * ball_size, 0, ball_speed, 0;
    239, 72, 54, 15 + width_inner/2 - 3/2 * ball_size, 13.5 + 3/4 * length_inner + 3 * ball_size, 1, ball_speed, 0;
    
    179, 55, 64, 15 + width_inner/2 + ball_size, 13 + 3/4 * length_inner + 4 * ball_size, 0, ball_speed, 0;
    249, 148, 6, 15 + width_inner/2 + 2 * ball_size, 13 + 3/4 * length_inner + 4 * ball_size, 1, ball_speed, 0;
    249, 148, 6, 15 + width_inner/2 - ball_size, 13 + 3/4 * length_inner + 4 * ball_size, 0, ball_speed, 0;
    7, 168, 132, 15 + width_inner/2 - 2 * ball_size, 13 + 3/4 * length_inner + 4 * ball_size, 0, ball_speed, 0;
    143, 68, 173, 15 + width_inner/2, 13 + 3/4 * length_inner + 4 * ball_size, 1, ball_speed, 0;
];

fig = figure;
hold on;
rectangle('Position', [0 0 width_outer length_outer], ...
    'Curvature', 0.2, 'FaceColor', band_color / 255);
rectangle('Position', [15 15 width_inner length_inner], ...
    'Curvature', 0.1, 'FaceColor', cloth_color / 255, 'EdgeColor', border_color / 255, ...
    'LineWidth', 4);
line([17 width_inner + 13], [1/4 * length_inner + 15 1/4 * length_inner + 15], 'Color', [1, 1, 1], 'LineWidth', 1)

rectangle('Position', [0 0 pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);
rectangle('Position', [width_outer - pocket_size 0 pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);
rectangle('Position', [width_outer - pocket_size length_outer - pocket_size pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);
rectangle('Position', [0 length_outer - pocket_size pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);
rectangle('Position', [width_outer - pocket_size + 5 length_outer/2 - pocket_size/2 pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);
rectangle('Position', [-5 length_outer/2 - pocket_size/2 pocket_size pocket_size], ...
    'Curvature', 1, 'FaceColor', pocket_color / 255);

rectangle('Position', [-10 1 10 length_outer], 'FaceColor', [1, 1, 1], 'EdgeColor', 'none');
rectangle('Position', [width_outer 1 10 length_outer], 'FaceColor', [1, 1, 1], 'EdgeColor', 'none');

rectangle('Position', [0 0 width_outer length_outer], 'EdgeColor', border_color / 255, 'Curvature', 0.15, 'LineWidth', 2);

axis equal

balls_rects = zeros(16);
balls_lines = zeros(16);

visible_balls = 16;

time = text(-75, 200, 'Time = 0');
hits = text(-75, 180, 'Ball collisions = 0');
hits_band = text(-75, 160, 'Band Hits = 0');

n = 100;

balls_path_x = zeros(visible_balls, n);
balls_path_y = zeros(visible_balls, n);
velocity_values = zeros(visible_balls, n);
hits_num = zeros(1, n);
hits_counter = 0;
hits_band_num = zeros(1, n);
hits_band_counter = 0;

for k = 1:n
    if ~ishghandle(fig)
        break
    end
    for i = 1:visible_balls
        if ~ishghandle(fig)
            break
        end
        cX = balls(i, 4);
        cY = balls(i, 5);
        cV = balls(i, 7);
        cA = balls(i, 8);
        
        [x, y] = move(cX, cY, cV, cA);
        balls(i, 4) = x;
        balls(i, 5) = y;

        cX = balls(i, 4);
        cY = balls(i, 5);
        [hit_band, v, a] = band_bounce(cX, cY, cA, cV);
        if hit_band
            hits_band_counter = hits_band_counter + 1;
        end
        balls(i, 7) = v;
        balls(i, 8) = a;

        balls(1, 7)
        for j = 1:visible_balls
            if ~ishghandle(fig)
                break
            end
            if i < j
                cX = balls(i, 4);
                cY = balls(i, 5);
                cV = balls(i, 7);
                cA = balls(i, 8);
                tX = balls(j, 4);
                tY = balls(j, 5);
                tV = balls(j, 7);
                tA = balls(j, 8);
                [hit, new_a1, new_vel1, new_a2, new_vel2] = ball_bounce(cX, cY, cV, cA, tX, tY, tV, tA, dt);
                if hit
                    hits_counter = hits_counter + 1;
                end
                balls(i, 8) = new_a1;
                balls(i, 7) = new_vel1;
                balls(j, 8) = new_a2;
                balls(j, 7) = new_vel2;
            end
        end
        balls(1, 7)
        
        balls(i, 7) = apply_friction(cloth_friction, balls(i, 7), dt);
        
        cX = balls(i, 4);
        cY = balls(i, 5);
        
        x = cX - ball_size/2;
        y = cY - ball_size/2;
        if balls_rects(i) ~= 0
            delete(balls_rects(i))
        end
        
        balls_rects(i) = rectangle('Position', [x y ball_size ball_size], ...
            'Curvature', 1, 'FaceColor', balls(i, 1:3) / 255);
        
        if balls_lines(i) ~= 0
            delete(balls_lines(i))
        end
        
        if balls(i, 6) == 1
            t = ball_size/2 - 1;
            balls_lines(i) = line([cX + t cX - t], [cY + t cY - t], 'Color', [1, 1, 1], 'LineWidth', 2);
        end
    end
    
    for i = 1:visible_balls
        velocity_values(i, k) = balls(i, 7);
        balls_path_x(i, k) = balls(i, 4);
        balls_path_y(i, k) = balls(i, 5);
    end
    
    hits_num(k) = hits_counter;
    hits_band_num(k) = hits_band_counter;

    set(time, 'String', ['Time = ', num2str(k * dt), 's']);
    set(hits, 'String', ['Ball collisions = ', num2str(hits_counter)]);
    set(hits_band, 'String', ['Band hits = ', num2str(hits_band_counter)]);
    pause(0.0001);
end
hold off;

figure;
hold on;
for i = 1:visible_balls
    plot(velocity_values(i, :), 'DisplayName', balls_names(i, :))
end
hold off;
xlabel('Time steps (0.001s)');
ylabel('Velocity (m/s)');
legend('-DynamicLegend');

figure;
hold on;
plot(hits_num);
plot(hits_band_num);
hold off;

figure;
hold on;
for i = 1:visible_balls
    plot(balls_path_x(i, :), balls_path_y(i, :))
end
hold off;


