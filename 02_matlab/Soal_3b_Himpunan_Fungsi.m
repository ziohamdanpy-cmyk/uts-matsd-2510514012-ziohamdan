% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3 — Himpunan Fungsi
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

% Definisi himpunan
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];
U = N : N+20;

fprintf('============================================\n');
fprintf('SOAL 3b: VERIFIKASI OPERASI HIMPUNAN\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('A = '); disp(A);
fprintf('B = '); disp(B);
fprintf('C = '); disp(C);
fprintf('U = '); disp(U);
fprintf('\n');

% Operasi himpunan
union_AB = union(A, B);
union_ABC = union(union(A, B), C);
intersect_ABC = intersect(intersect(A, B), C);

% (A ∪ B) ∩ C'
C_complement = setdiff(U, C);
union_AB_intersect_Ccomplement = intersect(union_AB, C_complement);

% Symmetric difference A ⊕ B
symdiff_AB = setxor(A, B);

fprintf('=== HASIL OPERASI HIMPUNAN ===\n');
fprintf('|A ∪ B ∪ C| = %d\n', length(union_ABC));
fprintf('Isi A ∪ B ∪ C: ');
fprintf('%.0f ', union_ABC);
fprintf('\n\n');

fprintf('|A ∩ B ∩ C| = %d\n', length(intersect_ABC));
fprintf('Isi A ∩ B ∩ C: ');
fprintf('%.0f ', intersect_ABC);
fprintf('\n\n');

fprintf('|(A ∪ B) ∩ C′| = %d\n', length(union_AB_intersect_Ccomplement));
fprintf('Isi (A ∪ B) ∩ C′: ');
fprintf('%.0f ', union_AB_intersect_Ccomplement);
fprintf('\n\n');

fprintf('|A ⊕ B| = %d\n', length(symdiff_AB));
fprintf('Isi A ⊕ B (symmetric difference): ');
fprintf('%.0f ', symdiff_AB);
fprintf('\n\n');

fprintf('Timestamp: %s\n', datetime('now'));
