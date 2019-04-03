[x,Fs] = audioread('singing44.wav');
output = phaseVocoder(x', 1024, 128, 17/18);
resampled = resample(output, 17,18);
soundsc(resampled, Fs);
audiowrite('exercise4.wav', resampled, Fs);