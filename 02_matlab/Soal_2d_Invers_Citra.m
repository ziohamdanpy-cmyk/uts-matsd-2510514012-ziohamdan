% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2 — Invers Citra
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

% Matriks kunci A
A = [a+1, b, 2; 1, a+2, b; b, 1, a+3];

fprintf('============================================\n');
fprintf('SOAL 2d: VERIFIKASI INVERS MATRIKS\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('Matriks A:\n');
disp(A);

% Invers manual (dari perhitungan 2c)
A_inv_manual = [1, -0.6, -0.2; 0, 0.4, -0.2; -0.5, 0.2, 0.4];

fprintf('Invers manual (dari perhitungan 2c):\n');
disp(A_inv_manual);

% Invers dari MATLAB
A_inv_matlab = inv(A);

fprintf('Invers dari MATLAB (inv(A)):\n');
disp(A_inv_matlab);

% Hitung Frobenius norm error
error_fro = norm(A_inv_manual - A_inv_matlab, 'fro');

fprintf('\n=== PERBANDINGAN ===\n');
fprintf('Frobenius norm error = %.2e\n', error_fro);

if error_fro < 1e-10
    fprintf('✓ VERIFIKASI BERHASIL: error < 1e-10\n');
    fprintf('  Invers manual sama dengan inv(A) MATLAB\n');
else
    fprintf('✗ VERIFIKASI GAGAL: error terlalu besar\n');
end

% Verifikasi A * A_inv = I
fprintf('\n=== VERIFIKASI A * A^{-1} = I ===\n');
I_manual = A * A_inv_manual;
I_matlab = A * A_inv_matlab;

fprintf('A × A^{-1} (manual):\n');
disp(round(I_manual, 4));

fprintf('A × A^{-1} (MATLAB):\n');
disp(round(I_matlab, 4));

% Loop nested untuk perhitungan manual (seperti contoh Tugas Pertemuan 2)
fprintf('\n=== PERHITUNGAN INVERS DENGAN LOOP NESTED ===\n');
detA = det(A);
fprintf('det(A) = %.0f\n\n', detA);

% Matriks kofaktor
C = zeros(3);
for i = 1:3
    for j = 1:3
        % Ambil submatriks (minor)
        sub = A;
        sub(i,:) = [];
        sub(:,j) = [];
        C(i,j) = ((-1)^(i+j)) * det(sub);
    end
end

fprintf('Matriks Kofaktor C:\n');
disp(C);

% Matriks Adjoin (transpose C)
Adj = C';
fprintf('Matriks Adjoin Adj(A):\n');
disp(Adj);

% Invers dari loop nested
A_inv_loop = Adj / detA;
fprintf('Invers dari loop nested:\n');
disp(A_inv_loop);

% Error loop vs MATLAB
error_loop = norm(A_inv_loop - A_inv_matlab, 'fro');
fprintf('Frobenius norm error (loop vs MATLAB) = %.2e\n', error_loop);

fprintf('\nTimestamp: %s\n', datetime('now'));
