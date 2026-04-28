% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Eksplorasi 
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% ===================================================== 
  
clc; clear; close all; 
  
% Parameter personalisasi 
N = 12;  a = 1;  b = 2;  K = 4; 
theta0 = 40;  % derajat 
alpha_lr = 0.003; 

% Hitung data toko
for i = 1:7
    D(i) = 20 + (K*i) + mod((a*i), 7) - mod((b*i), 5);
end

% Mean untuk garis rata-rata
mean_D = mean(D);

% Membuat figure
figure('Position', [100 100 800 500], 'Color', 'w');

% Diagram batang
bar(D, 'FaceColor', [0.2 0.5 0.8], 'EdgeColor', 'k', 'LineWidth', 1.5);
hold on;

% Garis rata-rata horizontal
yline(mean_D, 'r--', 'LineWidth', 2.5);

% Menambahkan nilai di atas batang
for i = 1:7
    text(i, D(i) + 1, num2str(D(i)), ...
        'HorizontalAlignment', 'center', ...
        'FontSize', 11, 'FontWeight', 'bold');
end

% Label sumbu
xlabel('Toko ke-', 'FontSize', 13, 'FontWeight', 'bold');
ylabel('Penjualan (juta rupiah)', 'FontSize', 13, 'FontWeight', 'bold');

% Judul dengan NIM
title(sprintf('Penjualan per Toko - NIM 2510514012'), ...
    'FontSize', 14, 'FontWeight', 'bold');

% Legend
legend('Penjualan', sprintf('Rata-rata = %.2f', mean_D), ...
    'Location', 'best', 'FontSize', 11);

% Grid
grid on;
set(gca, 'GridAlpha', 0.3);

% Sumbu x
set(gca, 'XTick', 1:7);
set(gca, 'XTickLabel', {'1', '2', '3', '4', '5', '6', '7'});

% Batas sumbu
ylim([0, 55]);

hold off;

% Simpan sebagai PNG
saveas(gcf, 'Soal1c_DiagramBatang_NIM_2510514012.png');
fprintf('Diagram batang telah disimpan sebagai: Soal1c_DiagramBatang_NIM_2510514012.png\n');
