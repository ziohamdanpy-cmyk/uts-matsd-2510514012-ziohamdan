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

% Parameter
theta0_deg = 40;  % derajat

% Bilangan kompleks w = 8·cis(40°)
r = 8;
theta0_rad = deg2rad(theta0_deg);
w = r * exp(1i * theta0_rad);

fprintf('============================================\n');
fprintf('SOAL 4e: PLOT AKAR KUBIK DI BIDANG ARGAND\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('w = 8·cis(40°) = %.4f + %.4fi\n', real(w), imag(w));
fprintf('r = %.0f, θ₀ = %.0f°\n\n', r, theta0_deg);

% Mencari ketiga akar kubik
n = 3;
akar = zeros(1, n);
fprintf('Akar kubik w = 8·cis(40°):\n');
for k = 0:n-1
    theta_k_deg = (theta0_deg + 360*k) / n;
    theta_k_rad = deg2rad(theta_k_deg);
    akar(k+1) = (r^(1/n)) * exp(1i * theta_k_rad);
    fprintf('z_%d = 2·cis(%.2f°) = %.4f + %.4fi\n', ...
        k, theta_k_deg, real(akar(k+1)), imag(akar(k+1)));
end
fprintf('\n');

% Plot di bidang Argand
figure('Position', [100 100 700 700], 'Color', 'w');

% Lingkaran dengan jari-jari 2 (akar pangkat tiga dari 8)
r_lingkaran = r^(1/3); % = 2
theta_circle = linspace(0, 2*pi, 500);
circle_x = r_lingkaran * cos(theta_circle);
circle_y = r_lingkaran * sin(theta_circle);
plot(circle_x, circle_y, 'b--', 'LineWidth', 1.5);
hold on;

% Plot ketiga akar
for k = 1:n
    plot(real(akar(k)), imag(akar(k)), 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r');
    text(real(akar(k)) + 0.1, imag(akar(k)) + 0.1, ...
        sprintf('z_%d', k-1), 'FontSize', 12, 'FontWeight', 'bold');
    % Vektor dari origin ke akar
    quiver(0, 0, real(akar(k)), imag(akar(k)), 0, ...
        'LineWidth', 1.5, 'Color', 'r', 'MaxHeadSize', 0.1);
end

% Garis sumbu
xline(0, 'k-', 'LineWidth', 1);
yline(0, 'k-', 'LineWidth', 1);

% Format plot
xlabel('Re(z)', 'FontSize', 12);
ylabel('Im(z)', 'FontSize', 12);
title(sprintf('Akar Kubik w = 8·cis(40°) di Bidang Argand\nNIM: 2510514012'), ...
    'FontSize', 13, 'FontWeight', 'bold');
axis equal;
xlim([-2.5, 2.5]);
ylim([-2.5, 2.5]);
grid on;

% Tunjukkan bahwa ketiga akar membentuk segitiga sama sisi
% Hubungkan akar-akar dengan garis
garis = [akar, akar(1)];
plot(real(garis), imag(garis), 'g-', 'LineWidth', 1.5);

% Legend
legend('Lingkaran |z| = 2', 'Akar kubik', 'Segitiga sama sisi', ...
    'Location', 'best');

% Simpan figure
saveas(gcf, 'Soal4e_Akar_Kubik_NIM_2510514012.png');
fprintf('Visualisasi telah disimpan sebagai: Soal4e_Akar_Kubik_NIM_2510514012.png\n');

% Hitung panjang sisi segitiga
sisi = abs(akar(2) - akar(1));
fprintf('\n=== BUKTI SEGITIGA SAMA SISI ===\n');
fprintf('Panjang sisi z0 ke z1: %.4f\n', abs(akar(2) - akar(1)));
fprintf('Panjang sisi z1 ke z2: %.4f\n', abs(akar(3) - akar(2)));
fprintf('Panjang sisi z2 ke z0: %.4f\n', abs(akar(1) - akar(3)));
if abs(abs(akar(2)-akar(1)) - abs(akar(3)-akar(2))) < 1e-5 && ...
   abs(abs(akar(3)-akar(2)) - abs(akar(1)-akar(3))) < 1e-5
    fprintf('\n✓ KETIGA SISI SAMA → MEMBENTUK SEGITIGA SAMA SISI\n');
end

fprintf('\nTimestamp: %s\n', datetime('now'));
