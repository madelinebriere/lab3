function [] = stft_rebuild(file, N, M)
[x,Fs] = audioread(file);
x = x';
[E,P] = stft_analysis(x, N, M);
output = stft_synthesis(E, P, N, M);
soundsc(output, Fs);
end