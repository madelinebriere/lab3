function [E,P] = stft_analysis(x, N, M)
%% Step A
X = buffer(x,N,N-M,'nodelay'); % Handles zero padding.
 
%% Step B
w = sqrt(2*M/N).*sin((pi/N).*((0:N-1)' + .5));
Xw = bsxfun(@times, X, w);
 
%% Step C
rows = ceil(N/2+1);
Xwf_temp = fft(Xw); % Columns = vectors.
Xwf = Xwf_temp(1:rows, :);
 
%% Step D
E = abs(Xwf).^2;
P = angle(Xwf);
 
figure(1)
imagesc(15*log(flipud(E)));
title('Energy Spectrum')
end
