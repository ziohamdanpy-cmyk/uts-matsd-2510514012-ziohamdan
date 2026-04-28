% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 — Kompleks
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

% Definisi bilangan kompleks
z1 = (a+2) + (b+1)*1i;
z2 = (b+1) - (a+2)*1i;

fprintf('============================================\n');
fprintf('SOAL 4b: VERIFIKASI OPERASI BILANGAN KOMPLEKS\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('z1 = %.0f + %.0fi\n', real(z1), imag(z1));
fprintf('z2 = %.0f + %.0fi\n', real(z2), imag(z2));
fprintf('\n');

% 1. Penjumlahan
z_add = z1 + z2;
fprintf('1. z1 + z2 = %.0f + %.0fi\n', real(z_add), imag(z_add));

% 2. Perkalian
z_mul = z1 * z2;
fprintf('2. z1 × z2 = %.0f + %.0fi\n', real(z_mul), imag(z_mul));

% 3. Pembagian
z_div = z1 / z2;
fprintf('3. z1 / z2 = %.0f + %.0fi\n', real(z_div), imag(z_div));

% 4. Modulus |z1 - z2|
z_diff = z1 - z2;
modulus_diff = abs(z_diff);
fprintf('4. |z1 - z2| = %.0f\n', modulus_diff);

fprintf('\nTimestamp: %s\n', datetime('now'));
