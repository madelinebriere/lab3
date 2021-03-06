function [E,P] = stft_analysis(x, Fs, N, M)
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

% Scaling: Talked with Greg about this.
figure(1)
xp = linspace(0,length(x)/Fs, size(E,2));
y = flip(log10(linspace(1,Fs/2,N/2)));

imagesc('XData',xp,'YData',y,'CData',flipud(log10(E)))
axis tight
xlabel('Time (seconds)')
ylabel('Frequency (log scale Hz)')
end

