[x,Fs] = audioread('singing44.wav');
output = phaseVocoder(x', Fs, 1024, 512, 1/2);
soundsc(output, Fs);
audiowrite('exercise3.wav', output, Fs);
