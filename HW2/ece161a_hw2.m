%1) 
t = 0 : 0.005 : 10;
f = 6.5;
xc = cos(2 * pi * f * t);
figure; %Figure 1
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
T = 0.1;
n = 0 : T : 10;
xs = cos(2* pi * f * n);
figure; %Figure 2
subplot(2, 1, 1);
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
stem(xs);
title('Discrete-Time Signal xs[n]');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 3
freqz(xc, 1, 'whole', 1024, 200)
figure; %Figure 4
freqz(xs, 1, 'whole', 1024, 10)
%Comments on my results:
% The plot of the sinusoid sampled at a rate of 200Hz looks like a
% continuous signal, but when I generate a stem of xs, it can be seen
% that the sinusoid isn't continuous because there isn't a continuous
% movement from the maximum positive amplitude to the maximum negative
% amplitude. Additionally, since xs is sampled at a rate below the Nyquist
% frequency, some information from the signal xc is lost, and therefore, can't
% be replicated. This aliasing can be seen in the frequency response as
% well as there is a peak magnitude at 3.5Hz instead of the actual frequency 6.5Hz.

%2)
%5Hz
T_5 = 0.2;
n_5 = 0 : T_5 : 5;
xs_5 = cos(2 * pi * f * n_5);
figure; %Figure 5
subplot(2, 1, 1);
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
stem(xs_5);
title('Discrete-Time Signal xs[n](5Hz)');
xlabel('Time');
ylabel('Amplitude');
figure;  %Figure 6
freqz(xs_5, 1, 'whole', 1024, 5)
%Comments:
%The stem for xs_5 is more spread out because the signal xc was sampled at
%a frequency lower than Nyquist rate. That means only some of the
%information related to the amplitudes is present, and it's not enough to
%reconstruct the signal. This aliasing can be seen in the frequency response as well
%with the peak magnitude being at 1.5Hz instead of the frequency 6.5Hz.

%8Hz
T_8 = 0.125;
n_8 = 0 : T_8 : 8;
xs_8 = cos(2 * pi * f * n_8);
figure; %Figure 7
subplot(2, 1, 1);
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
subplot(2, 1, 2);
stem(xs_8);
title('Discrete-Time Signal xs[n](8Hz)');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 8
freqz(xs_8, 1, 'whole', 1024, 8);
%Comments on my results:
%The stem for xs_8 is has more samples than that of xs_5, but it is still
%not enough to reconstruct the signal as it has been sampled below the
%Nyquist rate. This aliasing can be seen in the frequency response as well with the
%peak magnitude being at 1.5Hz instead of the actual frequency 6.5Hz.

%13Hz
T_13 = 1/13;
n_13 = 0 : T_13 : 13;
xs_13 = cos(2 * pi * f * n_13);
figure; %Figure 9
subplot(2, 1, 1);
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
subplot(2, 1, 2);
stem(xs_13);
title('Discrete-Time Signal xs[n](13Hz)');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 10
freqz(xs_13, 1, 'whole', 1024, 13);
%Comments on my results:
%The stem of xs_13 shows only the peak amplitudes of the signal, but since
%the signal has been sampled at Nyquist rate, we have just enough
%information to reconstruct the signal. This can be seen in the frequency
%response as well with the peak magnitude being at the correct frequency of
%6.5Hz.


%20Hz
T_20 = 0.05;
n_20 = 0 : T_20 : 20;
xs_20 = cos(2 * pi * f * n_20);
figure; %Figure 11
subplot(2, 1, 1);
plot(xc);
title('"Continuous" Signal xc(t)');
xlabel('Time');
ylabel('Amplitude');
subplot(2, 1, 2);
stem(xs_20);
title('Discrete-Time Signal xs[n](20Hz)');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 12
freqz(xs_20, 1, 'whole', 1024, 20);
%Comments on my results:
%Since the signal is sampled at a higher frequency than the Nyquist rate,
%the stem clearly shows more information pertaining to the signal.
%Additionally, the frequency response shows the peak magnitude at the
%correct frequency 6.5Hz, and it shows information for more points in the
%signal because it samples more points at this frequency than it did in
%previous frequencies.

%3) 
%3.5Hz
f_3_5 = 3.5;
xc_3_5 = cos(2 * pi * f_3_5 * t);
figure; %Figure 13
plot(xc_3_5);
title('"Continuous" Signal xc(t)(3.5Hz)');
xlabel('Time');
ylabel('Amplitude');
xs_3_5 = cos(2* pi * f_3_5 * n);
figure; %Figure 14
subplot(2, 1, 1);
plot(xc_3_5);
title('"Continuous" Signal xc(t)(3.5Hz)');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
stem(xs_3_5);
title('Discrete-Time Signal xs[n]');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 15
freqz(xc_3_5, 1, 'whole', 1024, 200)
figure; %Figure 16
freqz(xs_3_5, 1, 'whole', 1024, 10)
%Comments on my results:
%The stem clearly shows information pertaining to the signal as it is
%sampled above the Nyquist rate. Additionally, the frequency response also
%shows the peak magnitude at the correct frequency 3.5Hz.

%13.5Hz
f_13_5 = 13.5;
xc_13_5 = cos(2 * pi * f_13_5 * t);
figure; %Figure 17
plot(xc_13_5);
title('"Continuous" Signal xc(t)(13.5Hz)');
xlabel('Time');
ylabel('Amplitude');
xs_13_5 = cos(2* pi * f_13_5 * n);
figure; %Figure 18
subplot(2, 1, 1);
plot(xc_13_5);
title('"Continuous" Signal xc(t)(13.5Hz)');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
stem(xs_13_5);
title('Discrete-Time Signal xs[n]');
xlabel('Time');
ylabel('Amplitude');
figure; %Figure 19
freqz(xc_13_5, 1, 'whole', 1024, 200)
figure; %Figure 20
freqz(xs_13_5, 1, 'whole', 1024, 10)
%Comments on my results:
%The stem doesn't show the full information pertaining to the signal
%because there has been aliasing since the signal was sampled below the
%Nyquist rate. This can be seen in the frequency response as well with the
%peak magnitude being at 3.5Hz instead of the correct frequency 13.5Hz.

%There is no difference between the discrete time signals produced in this
%problem and in problem 1 because even though different signals were
%sampled, they were all sampled with the same frequency, which means that
%the amount of points in each sample were the same. The 3.5Hz signal was
%sampled above the Nyquist rate, so all the information pertaining the
%signal was recorded, but for the 6.5Hz and 13.5Hz signals, they were
%sampled below the Nyquist rate, so there was aliasing, which caused the
%signal to be folded back by 3.5Hz.