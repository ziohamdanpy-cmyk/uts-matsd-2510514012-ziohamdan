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

fprintf('============================================\n');
fprintf('SOAL 1b: VERIFIKASI STATISTIK DENGAN MATLAB\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('Data penjualan 7 toko: ');
fprintf('%.0f ', D);
fprintf('\n\n');

% Statistik deskriptif
mean_D = mean(D);
median_D = median(D);
mode_D = mode(D);
range_D = max(D) - min(D);
std_D = std(D, 1); % populasi

fprintf('=== HASIL STATISTIK ===\n');
fprintf('Mean   : %.4f\n', mean_D);
fprintf('Median : %.0f\n', median_D);
fprintf('Modus  : ');
if length(mode_D) == length(D)
    fprintf('Tidak ada modus (semua nilai unik)\n');
else
    fprintf('%.0f ', mode_D);
    fprintf('\n');
end
fprintf('Range  : %.0f\n', range_D);
fprintf('Std Dev (populasi): %.4f\n\n', std_D);

fprintf('Timestamp: %s\n', datetime('now'));
