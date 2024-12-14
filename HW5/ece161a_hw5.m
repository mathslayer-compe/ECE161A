passband = 0.4*pi;
stopband = 0.5*pi;
T = 1/16000;
omega_analog = 0:pi/20:pi/T;
omega_digital = 0:pi/200:pi;
ripple = 3;
attenuation = 30;

%1)
omega_p = passband / T;
omega_s = stopband / T;
[N, omega_p_ellip] = ellipord(omega_p,omega_s, ripple, attenuation, 's');
[num, den] = ellip(N, ripple, attenuation, omega_p_ellip, 's');
num_roots = roots(num);
den_roots = roots(den);
figure;
freqs(num, den, omega_analog);
title('Magnitude and Phase of Analog Elliptical Filter');
figure;
subplot(1,2,1);
plot(real(exp(1i*[0:pi/200:2*pi])), imag(exp(j*[0:pi/200:2*pi])), 'r');
title('Unit Circle');
xlabel('Real Part');
ylabel('Imaginary Part');
axis equal;  
grid
subplot(1,2,2);
hold on;
plot(real(num_roots), imag(num_roots), 'bo');
plot(real(den_roots), imag(den_roots), 'rx');       
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');  

axis equal;
grid

xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram with Unit Circle');

hold off;


%2)
[num_ellip, den_ellip] = bilinear(num, den, 1/T);
figure;
freqz(num_ellip, den_ellip, omega_digital);
num_ellip_roots = roots(num_ellip);
den_ellip_roots = roots(den_ellip);
figure;
hold on;
plot(real(num_ellip_roots), imag(num_ellip_roots), 'bo');
plot(real(den_ellip_roots), imag(den_ellip_roots), 'rx');       
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram of Bilinear Transformation with Unit Circle');
hold off;

%The passband and stopband do not meet the specs because the frequency
%response falls off too early. The analog specs can't be matched to the
%digital specs without prewarping the frequencies. The roots of the
%left-half s-plane were mapped to the interior of the unit circle in the
%z-plane.

%3)
omega_p_prewarp = 2/T*tan(passband/2);
omega_s_pre = 2/T*tan(stopband/2);
[N_pre, omega_p_pre] = ellipord(omega_p_prewarp, omega_s_pre, ripple, attenuation, 's');
[num_pre, den_pre] = ellip(N_pre, ripple, attenuation, omega_p_pre, 's');
[num_prewarp, den_prewarp] = bilinear(num_pre, den_pre, 1/T);
figure;
freqz(num_prewarp, den_prewarp, omega_digital);
num_pre_roots = roots(num_prewarp);
den_pre_roots = roots(den_prewarp);
figure;
hold on;
plot(real(num_pre_roots), imag(num_pre_roots), 'bo');
plot(real(den_pre_roots), imag(den_pre_roots), 'rx');
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram of Bilinear Transformation with prewarped Frequencies with Unit Circle');
hold off;

%This filter meets the specs. The frequency response falls once at the
%passband and again at the stopband before rising back up again. In the
%previous case, the frequency fell a second time a little earlier than the
%stopband. There are different poles and zeros than before but both are
%either on the unit circle(zeros) or the interior of the unit
%circle(poles).

%4)
[num_imp, den_imp] = impinvar(num, den, 1/T);
figure;
freqz(num_imp, den_imp, omega_digital);
num_imp_roots = roots(num_imp);
den_imp_roots = roots(den_imp);
figure;
hold on;
plot(real(num_imp_roots), imag(num_imp_roots), 'bo');
plot(real(den_imp_roots), imag(den_imp_roots), 'rx');
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram of Impulse Invariance');
hold off;

%The difference in this case compared to the bilinear transform cases is
%that there was aliasing in this case. The locations of the poles and zeros
%are inside the circle except for a zero that is outside of the circle. The
%zero from the imaginary axis is mapped outside of the circle.

%5) 
%Butterworth Filter
%1) 
omega_p = passband / T;
omega_s = stopband / T;
[N, omega_n] = buttord(omega_p,omega_s, ripple, attenuation, 's');
[num, den] = butter(N, omega_n, 's');
num_roots = roots(num);
den_roots = roots(den);
figure;
freqs(num, den, omega_analog);
title('Magnitude and Phase of Analog Butterworth Filter');
figure;
subplot(1,2,1);
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
title('Unit Circle');
xlabel('Real Part');
ylabel('Imaginary Part');
axis equal;  
grid
subplot(1,2,2);
hold on;
plot(real(num_roots), imag(num_roots), 'bo');
plot(real(den_roots), imag(den_roots), 'rx');       
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');  

axis equal;
grid

xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram of Analog Butterworth Filter with Unit Circle');

hold off;

%3)
omega_p_prewarp = 2/T*tan(passband/2);
omega_s_pre = 2/T*tan(stopband/2);
[N_pre, omega_n_pre] = buttord(omega_p_prewarp, omega_s_pre, ripple, attenuation, 's');
[num_pre, den_pre] = butter(N_pre, omega_n_pre, 's');
[num_prewarp, den_prewarp] = bilinear(num_pre, den_pre, 1/T);
figure;
freqz(num_prewarp, den_prewarp, omega_digital);
num_pre_roots = roots(num_prewarp);
den_pre_roots = roots(den_prewarp);
figure;
hold on;
plot(real(num_pre_roots), imag(num_pre_roots), 'bo');
plot(real(den_pre_roots), imag(den_pre_roots), 'rx');
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram of Bilinear Transformation with prewarped Frequencies with Unit Circle');
hold off;

%The digital filter with prewarped frequencies meets the spec after
%bilinear transformation. This filter has a much higher order than the
%elliptical filters as it has more poles and zeros.

%Chebyshev Filter
%1) 
omega_p = passband / T;
omega_s = stopband / T;
[N, omega_n] = cheb1ord(omega_p,omega_s, ripple, attenuation, 's');
[num, den] = cheby1(N, passband, omega_n, 's');
num_roots = roots(num);
den_roots = roots(den);
figure;
freqs(num, den, omega_analog);
title('Magnitude and Phase of Analog Chebyshev Type 1 Filter');
figure;
subplot(1,2,1);
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
title('Unit Circle');
xlabel('Real Part');
ylabel('Imaginary Part');
axis equal;  
grid
subplot(1,2,2);
hold on;
plot(real(num_roots), imag(num_roots), 'bo');
plot(real(den_roots), imag(den_roots), 'rx');       
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');  

axis equal;
grid

xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Diagram with Unit Circle');

hold off;

%3)
omega_p_prewarp = 2/T*tan(passband/2);
omega_s_pre = 2/T*tan(stopband/2);
[N_pre, omega_n_pre] = cheb1ord(omega_p_prewarp, omega_s_pre, ripple, attenuation, 's');
[num_pre, den_pre] = cheby1(N_pre, passband, omega_n_pre, 's');
[num_prewarp, den_prewarp] = bilinear(num_pre, den_pre, 1/T);
figure;
freqz(num_prewarp, den_prewarp, omega_digital);
num_pre_roots = roots(num_prewarp);
den_pre_roots = roots(den_prewarp);
figure;
hold on;
plot(real(num_pre_roots), imag(num_pre_roots), 'bo');
plot(real(den_pre_roots), imag(den_pre_roots), 'rx');
plot(real(exp(1i*(0:pi/200:2*pi))), imag(exp(1i*(0:pi/200:2*pi))), 'r');
title('Pole-Zero plot of Chebyshev Type 1 Filter with prewarped frequencies with unit circle');
hold off;

%The digital filter with prewarped frequencies meets the spec after
%bilinear transformation. This filter has a higher order than Elliptical
%but not as high as Butterworth. 