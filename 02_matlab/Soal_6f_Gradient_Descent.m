% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6 — Gradient Descent
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% ===================================================== 

clc; clear; close all;

profit = @(x) -2*x.^3 + 28*x.^2 + 100*x - 160;
profit_grad = @(x) -6*x.^2 + 56*x + 100;

alphas = [0.003, 0.03, 0.0003];
labels = {'α = 0.003 (optimal)', 'α = 0.03 (terlalu besar)', 'α = 0.0003 (terlalu kecil)'};
colors = {'b', 'r', 'g'};
n_iter = 200;

figure('Position', [100 100 800 500], 'Color', 'w');
hold on;

for i = 1:3
    x = 1;
    history = zeros(n_iter, 1);
    for k = 1:n_iter
        history(k) = profit(x);
        x = x + alphas(i) * profit_grad(x);
    end
    plot(1:n_iter, history, colors{i}, 'LineWidth', 1.5);
end

xlabel('Iterasi'); ylabel('Profit');
title('Sensitivitas Learning Rate pada Gradient Descent');
legend(labels, 'Location', 'best');
grid on;
hold off;
