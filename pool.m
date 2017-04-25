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

balls = {
    242, 242, 242, 15 + width_inner/2, 15 + 1/4 * length_inner;
    
    247, 202, 23, 15 + width_inner/2, 15 + 3/4 * length_inner;
    
    36, 116, 169, 15 + width_inner/2 - 1/2 * ball_size, 15 + 3/4 * length_inner + ball_size;
    239, 72, 54, 15 + width_inner/2 + 1/2 * ball_size, 15 + 3/4 * length_inner + ball_size;
    
    43, 43, 43, 15 + width_inner/2, 15 + 3/4 * length_inner + 2 * ball_size;
    7, 168, 132, 15 + width_inner/2 + ball_size, 15 + 3/4 * length_inner + 2 * ball_size;
    143, 68, 173, 15 + width_inner/2 - ball_size, 15 + 3/4 * length_inner + 2 * ball_size;
    
    179, 55, 64, 15 + width_inner/2 + 1/2 * ball_size, 15 + 3/4 * length_inner + 3 * ball_size;
    247, 202, 23, 15 + width_inner/2 - 1/2 * ball_size, 15 + 3/4 * length_inner + 3 * ball_size;
    36, 116, 169, 15 + width_inner/2 + 3/2 * ball_size, 15 + 3/4 * length_inner + 3 * ball_size;
    239, 72, 54, 15 + width_inner/2 - 3/2 * ball_size, 15 + 3/4 * length_inner + 3 * ball_size;
    
    143, 68, 173, 15 + width_inner/2 + ball_size, 15 + 3/4 * length_inner + 4 * ball_size;
    249, 148, 6, 15 + width_inner/2 + 2 * ball_size, 15 + 3/4 * length_inner + 4 * ball_size;
    7, 168, 132, 15 + width_inner/2 - ball_size, 15 + 3/4 * length_inner + 4 * ball_size;
    179, 55, 64, 15 + width_inner/2 - 2 * ball_size, 15 + 3/4 * length_inner + 4 * ball_size;
    249, 148, 6, 15 + width_inner/2, 15 + 3/4 * length_inner + 4 * ball_size;
};

figure;
rectangle('Position', [0 0 width_outer length_outer], ...
    'Curvature', 0.2, 'FaceColor', band_color / 255);
rectangle('Position', [15 15 width_inner length_inner], ...
    'Curvature', 0.1, 'FaceColor', cloth_color / 255, 'EdgeColor', border_color / 255, ...
    'LineWidth', 4);

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

c = 1;
for i = 1:16
    x = cell2mat(balls(i, 4)) - ball_size/2;
    y = cell2mat(balls(i, 5)) - ball_size/2;
    rectangle('Position', [x y ball_size ball_size], ...
        'Curvature', 1, 'FaceColor', cell2mat(balls(i, 1:3)) / 255);
    c = c + 1;
end
axis equal
