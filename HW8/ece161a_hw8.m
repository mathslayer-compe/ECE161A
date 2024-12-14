%A)
NFFT = 256; 
h = [1, 0, 0, 0, -0.5]; % h[n]
h_padded = [h, zeros(1, NFFT - length(h))];
H = fft(h_padded, NFFT);
omega = linspace(0, 2*pi, NFFT);
z = roots([1, 0, 0, 0, -0.5]);

% Plot h[n]
figure; %Figure 1
subplot(2,2,1);
stem(0:length(h)-1, h, 'filled');
xlabel('n'); ylabel('h[n]');
title('Impulse Response h[n]'); grid on;

% Plot zeros of H(z)
subplot(2,2,2);
zplane(z);
title('Zeros of H(z)');
grid on;

% Plot magnitude response
subplot(2,2,3);
plot(omega/(2*pi), abs(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H(k)|');
title('Magnitude Response of H[k]'); 
grid on;

% Plot phase response
subplot(2,2,4);
plot(omega/(2*pi), angle(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase Response of H[k]'); 
grid on;

%B)
%1)
H1 = 1 ./ H;
N = 16;
h1 = ifft(H1, N, 'symmetric');

figure; %Figure 2
% Plot linear magnitude and phase of H(k)
subplot(2, 2, 1);
plot(omega / (2*pi), abs(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H(k)|');
title('Magnitude of H(k)');
grid on;

subplot(2, 2, 2);
plot(omega / (2*pi), angle(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H(k)');
grid on;

% Plot linear magnitude and phase of H1(k)
subplot(2, 2, 3);
plot(omega / (2*pi), abs(H1));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H1(k)|');
title('Magnitude of H1(k)');
grid on;

subplot(2, 2, 4);
plot(omega / (2*pi), angle(H1));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H1(k)');
grid on;

%The inverse DFT solution of h1[n] is not identical to the analytical
%solution because it goes through temporal aliasing. 

%2)
% Plot h1[n]
figure; %Figure 3
subplot(1,2,1)
stem(0:N-1, h1, 'filled');
xlabel('n'); ylabel('h1[n]');
title('Impulse Response h1[n]');
grid on;

%Plot the zeros of H1(z)
poles_H = roots([1, 0, 0, 0, -0.5]);
subplot(1,2,2);
zplane([], poles_H);

%3)
h1_padded = [h1, zeros(1, NFFT - N)];
H1_fft = fft(h1_padded, NFFT);
figure; %Figure 4
subplot(1,2,1);
plot(omega / (2*pi), abs(H1_fft));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H1(k)|');
title('Magnitude of H1(k) (Zero-padded)');
grid on;

subplot(1,2,2);
plot(omega / (2*pi), angle(H1_fft));  
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H1(k) (Zero-padded)');
grid on;

%4)
H_z = fft(h, 32);  
H1_z = fft(h1, 32);
H2_z = H_z .* H1_z;  
h2 = ifft(H2_z, 32);  

% Plot h2[n] 
figure; %Figure 5
stem(0:31, real(h2))
title('h2[n]')
xlabel('n')
ylabel('h2[n]')

%5)
h2_truncated = real(h2(1:(N + N - 1)));
H2_z_truncated = h2_truncated; 
zeros_H2 = roots(H2_z_truncated);
figure; %Figure 6
zplane(zeros_H2);

%6) 
h2_augmented = [h2_truncated, zeros(1, NFFT - length(h2_truncated))];
H2_k = fft(h2_augmented, NFFT);
figure; %Figure 7
subplot(2,1,1)
plot(omega, abs(H2_k))
title('Magnitude of H_2(k)')
xlabel('\omega (radians/sample)')
ylabel('|H_2(k)|')
ylim([0, max(abs(H2_k))]) 
subplot(2,1,2)
plot(omega, angle(H2_k))
title('Phase of H_2(k)')
xlabel('\omega (radians/sample)')
ylabel('Phase(H_2(k))')
ylim([-pi, pi]) 


%C)
%1)
H1 = 1 ./ H;
N = 64;
h1 = ifft(H1, N, 'symmetric');

figure; %Figure 8
% Plot linear magnitude and phase of H(k)
subplot(2, 2, 1);
plot(omega / (2*pi), abs(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H(k)|');
title('Magnitude of H(k)');
grid on;

subplot(2, 2, 2);
plot(omega / (2*pi), angle(H));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H(k)');
grid on;

% Plot linear magnitude and phase of H1(k)
subplot(2, 2, 3);
plot(omega / (2*pi), abs(H1));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H1(k)|');
title('Magnitude of H1(k)');
grid on;

subplot(2, 2, 4);
plot(omega / (2*pi), angle(H1));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H1(k)');
grid on;

%The inverse DFT solution of h1[n] is not identical to the analytical
%solution because it goes through temporal aliasing. 

%2)
% Plot h1[n]
figure; %Figure 9
subplot(1,2,1)
stem(0:N-1, h1, 'filled');
xlabel('n'); ylabel('h1[n]');
title('Impulse Response h1[n]');
grid on;

%Plot the zeros of H1(z)
poles_H = roots([1, 0, 0, 0, -0.5]);
subplot(1,2,2);
zplane([], poles_H);

%3)
h1_padded = [h1, zeros(1, NFFT - N)];
H1_fft = fft(h1_padded, NFFT);
figure; %Figure 10
subplot(1,2,1);
plot(omega / (2*pi), abs(H1_fft));
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('|H1(k)|');
title('Magnitude of H1(k) (Zero-padded)');
grid on;

subplot(1,2,2);
plot(omega / (2*pi), angle(H1_fft));  
xlabel('Normalized Frequency (\omega / 2\pi)');
ylabel('Phase (radians)');
title('Phase of H1(k) (Zero-padded)');
grid on;

%4)
H_z = fft(h, 128);  
H1_z = fft(h1, 128);
H2_z = H_z .* H1_z;  
h2 = ifft(H2_z, 128);  

% Plot h2[n] 
figure; %Figure 11
stem(0:127, real(h2))
title('h2[n]')
xlabel('n')
ylabel('h2[n]')

%5)
h2_truncated = real(h2(1:(2*N- 1)));
H2_z_truncated = h2_truncated; 
zeros_H2 = roots(H2_z_truncated);
figure; %Figure 12
zplane(zeros_H2);

%6) 
h2_augmented = [h2_truncated, zeros(1, NFFT - length(h2_truncated))];
H2_k = fft(h2_augmented, NFFT);
figure; %Figure 13
subplot(2,1,1)
plot(omega, abs(H2_k))
title('Magnitude of H_2(k)')
xlabel('\omega (radians/sample)')
ylabel('|H_2(k)|')
ylim([0, max(abs(H2_k))]) 
subplot(2,1,2)
plot(omega, angle(H2_k))
title('Phase of H_2(k)')
xlabel('\omega (radians/sample)')
ylabel('Phase(H_2(k))')
ylim([-pi, pi]) 