function output = phaseVocoderFile(file, N, M, a)
[x,Fs] = audioread(file);
x=x';
output = phaseVocoder(x,N,M,a);
soundsc(output, Fs);
end