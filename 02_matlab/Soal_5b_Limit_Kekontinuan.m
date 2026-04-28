% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Limit Kekontinuan 
%  --------------------------------------------------- 
%  Nama  : Ziohamdan Putra Yudhana
%  NIM   : 2510514012
%  Parameter: N=12, a=1, b=2, K=4, theta0=40, alpha=0.003 
%  Tanggal: <2026-04-28> 
% ===================================================== 

clc; clear;

syms x

% Parameter
K = 4; a = 1; b = 2;

% L1: limit (x^2 - K^2)/(x - K) saat x -> K
f1 = (x^2 - K^2)/(x - K);
L1 = limit(f1, x, K);

% L2: limit [sqrt(x + (K+1)^2) - (K+1)]/x saat x -> 0
f2 = (sqrt(x + (K+1)^2) - (K+1))/x;
L2 = limit(f2, x, 0);

% L3: limit [(a+2)x^3 + b*x + 7]/(x^3 - x + K) saat x -> inf
f3 = ((a+2)*x^3 + b*x + 7)/(x^3 - x + K);
L3 = limit(f3, x, inf);

fprintf('============================================\n');
fprintf('SOAL 5b: VERIFIKASI LIMIT DENGAN MATLAB\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('L1 = lim (x^2 - %d)/(x - %d) = %s\n', K, K, char(L1));
fprintf('L2 = lim [√(x + %d) - %d]/x = %s\n', (K+1)^2, K+1, char(L2));
fprintf('L3 = lim [%dx^3 + %dx + %d]/(x^3 - x + %d) = %s\n', a+2, b, 7, K, char(L3));

fprintf('\nTimestamp: %s\n', datetime('now'));
