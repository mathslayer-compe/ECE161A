%2) 
%The passband ripple is 3db and the stopband attenuation is 40db, so A_pass
%= 3db and A_stop = 40db. The passband ripple will be 10^{A_pass/20} =
%0.4125 and the stopband deviation will be 10{-A_stop/20}= 0.01 in the
%dev scale.
dev = [0.4125, 0.01]; 
[n, fo, ao, w] = firpmord([0.5 0.6], [1 0], dev); %Firpmord uses the normalized passband(0.5pi) and stopband(0.6pi) frequencies along with the desired amplitude 1 at the passband and 0 at the stopband.
n = n+4; %increasing the order by 4 in order to meet the specs for this filter
b = firpm(n, fo, ao, w);
freqz(b, 1, 1024); %frequency response(Figure 1)
%The phase response of this filter follows a linear pattern whether it's
%increasing or decreasing.

figure; %Figure 2
[h, w] = freqz(b, 1, 1024); 
plot(w/pi, 20*log10(abs(h))); %zooming in on the magnitude response
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Zoomed Magnitude Response');
figure; %Figure 3
zplane(b, 1); %pole-zero plot of FIR filter
title('Pole-Zero Plot of the FIR Filter');
%All the zeros also had their complex conjugates as zeros. This symmetry in
%the zeros indicates that the phase response of the filter is linear.

%3) 
fs = 2; %This is the sampling frequency that will best fit the amplitude and normalized frequencies in the kaiserord function.
[n, wn, beta, ftype] = kaiserord([0.5 0.6], [1 0], dev, fs);
b = fir1(n, wn, kaiser(n+1, beta));
figure; %Figure 4
freqz(b, 1, 1024);
title('Frequency Response of Kaiser-Window FIR Filter');
%The phase response of this filter appears to be following a linear
%pattern.

figure; %Figure 5
[h, w] = freqz(b, 1, 1024);
plot(w/pi, 20*log10(abs(h)));
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Zoomed Magnitude Response of Kaiser-Window FIR Filter');

figure; %Figure 6
zplane(b, 1);
title('Pole-Zero Plot of the Kaiser-Window FIR Filter');
%All the zeros also had their complex conjugates as zeros. This symmetry in
%the zeros indicates that the phase response of the filter is linear.

%4)
%In this part, I will be using a Blackman window for my FIR filter.

[n, wn, ~, ~] = kaiserord([0.5 0.6], [1 0], dev, fs); %using the same sampling frequency as the Kaiser window 
n = n+36; %The order must be increased by 36 for the filter to meet the specs.
b = fir1(n, wn, blackman(n + 1)); %
figure; %Figure 7
% Plot frequency response
freqz(b, 1, 1024);
title('Frequency Response of Blackman-Window FIR Filter');
%The phase response of this filter appears to be following a linear
%pattern.

figure; %Figure 8
% Check passband and stopband specs
[h, w] = freqz(b, 1, 1024);
plot(w/pi, 20*log10(abs(h)));
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('Zoomed Magnitude Response of Blackman-Window FIR Filter');

figure; %Figure 9
zplane(b, 1);
title('Pole-Zero Plot of Blackman-Window FIR Filter');

%All the zeros also had their complex conjugates as zeros. This symmetry in
%the zeros indicates that the phase response of the filter is linear.
