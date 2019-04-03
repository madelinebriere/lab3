N = 256;
x = randn(1,256);
X = fft(x);
result = conj(fliplr(X(2:end)))-X(2:end);

figure(1)
hold on
subplot(2,1,1);
stem(x)
title('Warmup a')
xlabel('Time (sample)')

subplot(2,1,2);
stem(result);
xlabel('Sample')

Y=(randn(1,256)+1i*randn(1,256))/sqrt(2);
Z=Y+conj([Y(1) fliplr(Y(2:end))]);
Z_x=-128:127;
figure(2)
stem(Z_x, Z)
title('Warmup b')