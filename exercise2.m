clear
[notwhisper,Fs] = audioread('notawhisper.wav');
[whisper,~] = audioread('whisper.wav');

[E,P] = stft_analysis(notwhisper', Fs, 512, 256);
P = 2*pi*rand(size(P));
x = stft_synthesis(E,P,512,256);

disp('Reconstructed whisper');
soundsc(x, Fs);
pause

disp('Filtered whisper');
cheby = cheby1(1, .01, .05, 'high');
filtered = conv(x, cheby);
soundsc(filtered,Fs);

figure(2)
hold on
[p1, x1] = pwelch(x, ones(1,256));
[p2, x2] = pwelch(whisper, ones(1,256)); 
[p3, x3] = pwelch(filtered, ones(1,256));

[Pxx1 F1] = pwelch(x,ones(1,256));
Pxx1dB = 10*log10(Pxx1);
semilogx(F1,Pxx1dB,'r')
[Pxx2 F2] = pwelch(whisper,ones(1,256));
Pxx2dB = 10*log10(Pxx2);
semilogx(F2,Pxx2dB)
[Pxx3 F3] = pwelch(filtered,ones(1,256));
Pxx3dB = 10*log10(Pxx3);
semilogx(F3,Pxx3dB)

title('PWelch Power Spectral Density')
xlabel('Rad/sample')
ylabel('dB')
legend('Reconstructed','Original', 'Filtered');