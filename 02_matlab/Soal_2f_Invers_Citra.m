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

% Blok piksel asli P
P = [120, 50+N, 200;
     80, a+2, 10+N;
     30+N, 90, 170];

fprintf('============================================\n');
fprintf('SOAL 2f: VISUALISASI ENKRIPSI CITRA\n');
fprintf('NIM: 2510514012\n');
fprintf('============================================\n\n');

fprintf('Blok Piksel Asli P (0-255):\n');
disp(P);

% Enkripsi
E = A * P;
fprintf('\nBlok Terenkripsi E:\n');
disp(E);

% Normalisasi untuk tampilan (citra grayscale 0-255)
% Karena hasil enkripsi bisa melebihi 255, perlu dinormalisasi atau clipping
P_normalized = uint8(P);  % asli sudah 0-255

% Normalisasi E ke range 0-255 untuk tampilan
E_min = min(E(:));
E_max = max(E(:));
E_normalized = uint8(255 * (E - E_min) / (E_max - E_min));

% Visualisasi dalam satu subplot
figure('Position', [100 100 900 400], 'Color', 'w');

% Subplot kiri: Citra asli
subplot(1, 2, 1);
imshow(P_normalized, []);
title(sprintf('Citra Asli P\nUkuran: 3x3 pixel'), 'FontSize', 12);
colormap(gca, 'gray');
colorbar;

% Tambahkan nilai pixel pada gambar asli
hold on;
for i = 1:3
    for j = 1:3
        text(j-0.5, i-0.5, num2str(P(i,j)), ...
            'HorizontalAlignment', 'center', ...
            'Color', 'red', 'FontSize', 10, 'FontWeight', 'bold');
    end
end

% Subplot kanan: Citra terenkripsi
subplot(1, 2, 2);
imshow(E_normalized, []);
title(sprintf('Citra Terenkripsi E = A × P\n(ternormalisasi ke 0-255)'), 'FontSize', 12);
colormap(gca, 'gray');
colorbar;

% Tambahkan nilai pixel pada gambar terenkripsi
hold on;
for i = 1:3
    for j = 1:3
        text(j-0.5, i-0.5, sprintf('%.0f', E(i,j)), ...
            'HorizontalAlignment', 'center', ...
            'Color', 'red', 'FontSize', 9, 'FontWeight', 'bold');
    end
end

% Judul utama
sgtitle(sprintf('Enkripsi Blok Citra 3x3 - NIM 2510514012'), ...
    'FontSize', 14, 'FontWeight', 'bold');

% Simpan sebagai file PNG
saveas(gcf, 'Soal2f_Visualisasi_Citra_NIM_2510514012.png');
fprintf('\nVisualisasi telah disimpan sebagai: Soal2f_Visualisasi_Citra_NIM_2510514012.png\n');

% Informasi tambahan
fprintf('\n=== INFORMASI ===\n');
fprintf('Ukuran blok: 3x3 pixel\n');
fprintf('Nilai pixel asli: antara 0-255 (grayscale)\n');
fprintf('Nilai pixel terenkripsi: antara %.0f - %.0f\n', E_min, E_max);
fprintf('Citra terenkripsi dinormalisasi ke 0-255 untuk tampilan\n');
fprintf('Dekripsi akan mengembalikan ke nilai asli (lihat soal 2e)\n');
