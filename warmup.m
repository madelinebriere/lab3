N = 256;
x = randn(1,256);
X = fft(x);
result = conj(fliplr(X(2:end)))-X(2:end);

figure(1)
hold on
subplot(2,1,1);
stem(x)
title('Original Signal - Warmup a')
xlabel('Time (sample)')

subplot(2,1,2);
stem(result);
title('FFT of Signal - Warmup a')
xlabel('Sample (value of k)')

Y=(randn(1,256)+1i*randn(1,256))/sqrt(2);
Z=Y+conj([Y(1) fliplr(Y(2:end))]);
Z_x=-128:127;
z = ifft(Z)
 
figure(2)
hold on
subplot(2,1,1);
stem(Z_x, Z)
title('FFT of Signal - Warmup b')
xlabel('Sample (value of k)')

subplot(2,1,2);
stem(z);
title('IFFT of FFT - Warmup b')
xlabel('Time (sample)')
