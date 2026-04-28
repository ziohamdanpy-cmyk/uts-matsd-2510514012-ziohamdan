% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 — Forecasting
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% =====================================================

clc; clear; close all;

% Data historis
t = (1:12)';
S = [52, 60, 60, 68, 68, 76, 76, 84, 84, 92, 92, 100]';

% Regresi linear (polyfit orde 1)
p = polyfit(t, S, 1);
slope = p(1);
intercept = p(2);

fprintf('=== SOAL 7.4e: FORECASTING ===\n');
fprintf('Garis tren linear: S = %.4f×n + %.4f\n', slope, intercept);

% Hitung tren untuk data historis
trend_hist = polyval(p, t);

% Prediksi 6 bulan ke depan (n = 13 sampai 18)
t_pred = (13:18)';
S_pred = polyval(p, t_pred);

fprintf('\nPrediksi penjualan 6 bulan ke depan:\n');
for i = 1:6
    fprintf('  Bulan %d: %.2f juta rupiah\n', t_pred(i), S_pred(i));
end

% Plot
figure('Position', [100 100 800 500], 'Color', 'w');

% Data historis (biru, titik)
plot(t, S, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b'); hold on;

% Garis tren linear (merah putus-putus)
plot(t, trend_hist, 'r--', 'LineWidth', 2);

% Prediksi (hijau, segitiga)
plot(t_pred, S_pred, 'g^', 'MarkerSize', 8, 'MarkerFaceColor', 'g', 'LineWidth', 1.5);

% Perpanjang garis tren sampai prediksi
t_full = [t; t_pred];
trend_full = polyval(p, t_full);
plot(t_full, trend_full, 'r--', 'LineWidth', 1, 'HandleVisibility', 'off');

% Format plot
xlabel('Bulan ke-n', 'FontSize', 12);
ylabel('Penjualan (juta rupiah)', 'FontSize', 12);
title('Forecasting Penjualan 6 Bulan ke Depan', 'FontSize', 14);
legend('Data historis', 'Garis tren linear', 'Prediksi', 'Location', 'best');
grid on;
xlim([0, 19]);
ylim([40, 120]);
hold off;

fprintf('\nTimestamp: %s\n', datetime('now'));
