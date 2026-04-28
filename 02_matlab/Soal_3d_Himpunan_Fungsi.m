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

% Definisi fungsi
syms x
f = K*x + (a+b);  % f(x) = 4x + 3
g = x^2/(b+1) + a; % g(x) = x^2/3 + 1

fprintf('============================================\n');
fprintf('SOAL 3d: INVERS FUNGSI DAN VERIFIKASI\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('f(x) = %s\n', char(f));
fprintf('g(x) = %s\n\n', char(g));

%% Mencari invers f⁻¹(x)
% f(x) = 4x + 3 = y
% 4x = y - 3
% x = (y - 3)/4
% f⁻¹(y) = (y - 3)/4

f_inv = (x - 3)/4;
fprintf('f⁻¹(x) = %s\n\n', char(f_inv));

% Verifikasi f(f⁻¹(x)) = x dan f⁻¹(f(x)) = x
f_compose_inv = subs(f, x, f_inv);
f_inv_compose_f = subs(f_inv, x, f);

fprintf('=== VERIFIKASI INVERS ===\n');
fprintf('f(f⁻¹(x)) = %s\n', simplify(f_compose_inv));
fprintf('f⁻¹(f(x)) = %s\n\n', simplify(f_inv_compose_f));

%% Tim akuntansi: pendapatan total = (K·100 + a + b) ribu rupiah
pendapatan = K*100 + (a+b); % = 400 + 3 = 403 ribu rupiah
fprintf('=== APLIKASI BISNIS ===\n');
fprintf('Pendapatan total dari satu pelanggan = Rp %d.000\n', pendapatan);
fprintf('Pendapatan = f(x) = 4x + 3 = %d\n\n', pendapatan);

% Mencari volume pembelian x menggunakan solve
persamaan = f == pendapatan;
x_volume = solve(persamaan, x);

fprintf('Mencari x sehingga f(x) = %d:\n', pendapatan);
fprintf('4x + 3 = %d\n', pendapatan);
fprintf('4x = %d\n', pendapatan - 3);
fprintf('x = %d/4 = %d\n\n', pendapatan - 3, x_volume);

fprintf('Volume pembelian x = %.0f unit\n', double(x_volume));

% Verifikasi dengan subs
f_verif = subs(f, x, x_volume);
fprintf('\nVerifikasi dengan subs: f(%.0f) = %.0f = pendapatan target ✓\n', ...
    double(x_volume), double(f_verif));

%% Verifikasi dengan solve dan subs
fprintf('\n=== VERIFIKASI MENGGUNAKAN solve DAN subs ===\n');

% Menggunakan solve untuk mencari x dari f(x) = pendapatan
x_solve = solve(f == pendapatan, x);
fprintf('solve(f(x) = %d): x = %s\n', pendapatan, char(x_solve));

% Menggunakan subs untuk verifikasi
f_subs = subs(f, x, x_solve);
fprintf('subs(f, x, x_solve) = %s = pendapatan ✓\n', char(f_subs));

% Menggunakan f⁻¹ langsung
x_inv = subs(f_inv, x, pendapatan);
fprintf('f⁻¹(pendapatan) = (%d - 3)/4 = %.0f ✓\n', pendapatan, double(x_inv));

%% Visualisasi fungsi f(x) dan f⁻¹(x)
figure('Position', [100 100 800 600], 'Color', 'w');

% Plot f(x)
subplot(2,2,1);
fplot(f, [0, 120], 'b-', 'LineWidth', 2);
xlabel('x (volume pembelian)'); ylabel('f(x) (ribu rupiah)');
title('Fungsi Harga f(x) = 4x + 3');
grid on;

% Plot f⁻¹(x)
subplot(2,2,2);
fplot(f_inv, [0, 500], 'r-', 'LineWidth', 2);
xlabel('y (pendapatan, ribu rupiah)'); ylabel('f^{-1}(y) (volume)');
title('Fungsi Invers f^{-1}(y) = (y-3)/4');
grid on;

% Plot f(x) dan garis y = pendapatan
subplot(2,2,3);
fplot(f, [0, 120], 'b-', 'LineWidth', 2); hold on;
yline(pendapatan, 'r--', sprintf('Pendapatan = %d', pendapatan), 'LineWidth', 1.5);
x_volume_double = double(x_volume);
plot(x_volume_double, pendapatan, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
xlabel('x (volume pembelian)'); ylabel('f(x) (ribu rupiah)');
title(sprintf('Mencari x sehingga f(x) = %d', pendapatan));
legend('f(x)', 'Target pendapatan', sprintf('Solusi: x = %.0f', x_volume_double));
grid on;

% Plot f(x) dan garis identitas
subplot(2,2,4);
fplot(f, [0, 120], 'b-', 'LineWidth', 1.5); hold on;
fplot(f_inv, [0, 500], 'r-', 'LineWidth', 1.5);
fplot(x, [0, 120], 'k--', 'LineWidth', 1);
xlabel('x'); ylabel('y');
title('Fungsi f(x) dan f^{-1}(x)');
legend('f(x)', 'f^{-1}(x)', 'y = x', 'Location', 'best');
grid on;

sgtitle(sprintf('Invers Fungsi dan Aplikasi Bisnis - NIM 2510514012'), ...
    'FontSize', 14, 'FontWeight', 'bold');

% Simpan figure
saveas(gcf, 'Soal3d_Invers_Fungsi_NIM_2510514012.png');
fprintf('\nVisualisasi telah disimpan sebagai: Soal3d_Invers_Fungsi_NIM_2510514012.png\n');
