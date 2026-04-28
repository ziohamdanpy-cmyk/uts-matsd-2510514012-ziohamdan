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

% Parameter
a = 1; b = 2; K = 4;
alpha = 0.003;
n_iter = 500;

% Fungsi profit dan turunannya
profit = @(x) -2*x.^3 + 28*x.^2 + 100*x - 160;
profit_grad = @(x) -6*x.^2 + 56*x + 100;

% Gradient Descent
x = 1;
history = zeros(n_iter, 1);

for i = 1:n_iter
    history(i) = profit(x);
    x = x + alpha * profit_grad(x);
end

x_opt_gd = x;
profit_opt_gd = profit(x_opt_gd);

% Solusi analitik dari 6.1
x_analitik = 10.867;
profit_analitik = profit(x_analitik);

fprintf('=== SOAL 6.2e: HASIL GRADIENT DESCENT ===\n');
fprintf('Iterasi: %d\n', n_iter);
fprintf('Learning rate (alpha): %.4f\n', alpha);
fprintf('Titik awal (x0): 1\n\n');

fprintf('Solusi analitik:\n');
fprintf('  x* = %.4f\n', x_analitik);
fprintf('  profit = %.2f\n\n', profit_analitik);

fprintf('Solusi Gradient Descent:\n');
fprintf('  x* = %.6f\n', x_opt_gd);
fprintf('  profit = %.6f\n', profit_opt_gd);
fprintf('  Error = %.6f\n', abs(x_analitik - x_opt_gd));

% Plot konvergensi
figure('Position', [100 100 800 500], 'Color', 'w');

subplot(2,1,1);
plot(1:n_iter, history, 'b-', 'LineWidth', 1.5);
xlabel('Iterasi'); ylabel('Profit');
title('Konvergensi Gradient Descent');
grid on;

subplot(2,1,2);
semilogy(1:n_iter, abs(history - profit_analitik), 'r-', 'LineWidth', 1.5);
xlabel('Iterasi'); ylabel('|Profit - Profit Optimum|');
title('Error Konvergensi (Skala Log)');
grid on;

% Plot kurva profit
figure('Position', [100 100 800 500], 'Color', 'w');
x_range = linspace(0, 15, 200);
y_range = profit(x_range);
plot(x_range, y_range, 'b-', 'LineWidth', 2); hold on;
plot(x_analitik, profit_analitik, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r');
plot(x_opt_gd, profit_opt_gd, 'gs', 'MarkerSize', 12, 'MarkerFaceColor', 'g');
xlabel('Harga (x)', 'FontSize', 12);
ylabel('Profit', 'FontSize', 12);
title('Kurva Profit dan Titik Optimum', 'FontSize', 14);
legend('π(x)', 'Solusi Analitik', 'Gradient Descent', 'Location', 'best');
grid on;
