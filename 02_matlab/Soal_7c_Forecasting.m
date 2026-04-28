% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 — Forecasting
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% =====================================================

clc; clear;

K = 4; a = 1;

% Barisan Sn
n = 1:12;
Sn = 50 + K*n + ((-1).^n)*2;

% T1
T1 = sum(Sn);

% T2
T2 = sum(Sn.^2);

fprintf('=== VERIFIKASI MATLAB ===\n\n');
fprintf('Barisan Sn: ');
fprintf('%.0f ', Sn);
fprintf('\n\n');

fprintf('T1 = Σ Sn (total penjualan 12 bulan):\n');
fprintf('Manual = 912\n');
fprintf('MATLAB = %.0f\n', T1);
fprintf('Status: %s\n\n', mat2str(T1 == 912));

fprintf('T2 = Σ Sn² (sum of squares):\n');
fprintf('Manual = 71744\n');
fprintf('MATLAB = %.0f\n', T2);
fprintf('Status: %s\n', mat2str(T2 == 71744));

fprintf('\nTimestamp: %s\n', datetime('now'));
