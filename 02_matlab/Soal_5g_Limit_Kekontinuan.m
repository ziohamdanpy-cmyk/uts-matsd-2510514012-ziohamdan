% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Limit Kekontinuan
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% ===================================================== 

clc; clear; close all;

% Parameter
K = 4; a = 1;

% Nilai p dan q dari perhitungan manual (soal 5.4)
p = 8;
q = 4;

% Definisikan fungsi piecewise
% Untuk x < K: C(x) = x + K = x + 4
% Untuk x = K: C(x) = p = 8
% Untuk x > K: C(x) = a*x + q = x + 4

% Interval plot
x_left = linspace(0, K - 0.01, 200);
x_right = linspace(K + 0.01, 2*K, 200);

% Nilai fungsi
C_left = x_left + K;
C_right = x_right + q;

% Plot
figure('Position', [100 100 800 600], 'Color', 'w');

% Plot kiri (x < K)
plot(x_left, C_left, 'b-', 'LineWidth', 2.5); hold on;

% Plot kanan (x > K)
plot(x_right, C_right, 'b-', 'LineWidth', 2.5);

% Plot titik sambung di x = K
plot(K, p, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r');

% Garis vertikal tipis di x = K
xline(K, 'k--', sprintf('x = %d', K), 'LabelVerticalAlignment', 'bottom', 'LineWidth', 1);

% Format plot
xlabel('x', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('C(x)', 'FontSize', 12, 'FontWeight', 'bold');
title(sprintf('Fungsi Biaya C(x) Kontinu di x = %d - NIM 2510514012', K), ...
    'FontSize', 14, 'FontWeight', 'bold');
legend('C(x) untuk x < K dan x > K', sprintf('Titik (K, p) = (%d, %d)', K, p), ...
    'Location', 'best');
grid on;
xlim([0, 2*K]);
ylim([0, 2*K + 4]);

% Simpan figure
saveas(gcf, 'Soal5g_Fungsi_Biaya_Kontinu_NIM_2510514012.png');
fprintf('Visualisasi telah disimpan sebagai: Soal5g_Fungsi_Biaya_Kontinu_NIM_2510514012.png\n');
fprintf('Timestamp: %s\n', datetime('now'));
