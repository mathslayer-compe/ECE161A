% 1) 
numerator = [0.1843, 0.4836, 0.4836, 0.1843];
denominator = [1, -0.0982, 0.5521, -0.118];
poles = roots(denominator);
zeros = roots(numerator);
% The poles of this transfer function are: -0.0537+0.7558i, -0.0537-0.7558i, 
% and 0.2055.

%The zeros of this transfer function are: -1, -0.8120+0.5837i, and
% -0.8120-0.5837i.

%2) 
figure;
zplane(zeros, poles);
%The roots on the plot are the same as the ones I got from the roots
%command.
zero_coefficients = poly(zeros);
%The coefficients of the numerator according to the poly command are: 1,
%2.624, 2.624, and 1. I will try to scale them by 0.1843 and see what I
%get.
zero_coefficients = zero_coefficients * 0.1843;
%Now I get the same zero coefficients that I started out with.
pole_coefficients = poly(poles);
%The coefficients of the denominator according to the poly command are: 1,
%-0.0982, 0.5521, and -0.118.

%I get the same coefficients that I started out with.

%3)
figure;
freqz(numerator, denominator, 'whole', 1024);
%This is a bandpass filter because it passes frequencies between 0.8pi and
%1.2pi radians and attenuates any frequencies outside of that range.

%4)
figure;
impz(numerator,denominator,64);
[h_z,t] = impz(numerator, denominator, 64);
impulse = [];
for i = 1:64
    if i == 1
        impulse(i) = 1;
    else
        impulse(i) = 0;
    end
end
impulse = impulse';
filter_impulse = filter(numerator, denominator, impulse); % need to load impulse response into the filter
isEqual = isequal(h_z, filter_impulse); 
%isEqual has the value 1, which means that both are the same therefore the
% impulse response is the same.

%I get the same response from filter as I would from impz.

%5)
x_n = [];
for n=0:63
    x_n = [x_n, cos(0.15*pi*n)+(2*cos(0.75*pi*n))];
end
[b,a] = deal(x_n, 1);
figure;
freqz(b, a, 1024)

% 6)
y_n = filter(numerator, denominator, x_n');
figure;
stem(x_n')
figure;
stem(y_n)
figure;
freqz(y_n, 1, 1024)
%The filter has attenuated the high frequency components and amplified
%components in the lower frequencies.
