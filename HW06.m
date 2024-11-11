%% HW06
close all; clear; clc;

%% The root locus

s = tf('s');
sysLnumer = (s + 1) * (s^2 + 81);
sysLdenom = (s + 13) * (s^2) * (s^2 + 100);
sysL = sysLnumer / sysLdenom;

figa = figure(Name = "Root Locus");
rlocus(sysL);
lines = findobj(gcf, 'Type', 'line');
set(lines, 'LineWidth', 2);  % Set all lines to a thicker width of 2
grid on;
title("");
%axis([-inf, 7, -1.003, -0.9]);
set(figa, "position", [100, 50, 1000, 550]);
saveas(figa, "HW06/Fig/a_Root_Locus.png");

[K, p] = rlocfind(sysL, -1.0915 + 1.0869i);

zeta = - real(p) ./ abs(p);

%% The step response
sys = K * sysL / (1 + K * sysL);

figd = figure(Name = "Step Response");
step(sys);
lines = findobj(gcf, 'Type', 'line');
set(lines, 'LineWidth', 2);  % Set all lines to a thicker width of 2
grid on;
title("");
%axis([-inf, 7, -1.003, -0.9]);
set(figd, "position", [200, 50, 1000, 550]);
saveas(figd, "HW06/Fig/d_Step_Response.png");
