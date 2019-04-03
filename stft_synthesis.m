function output = stft_synthesis(E, P, N, M)
%% Step A
k = 1:ceil(N/2);
Xm(k, :) = sqrt(E(k, :)).*exp(j.*P(k, :));
hXwf = [Xm; flipud(Xm)];

%% Step B
hXwfi = real(ifft(hXwf));

%% Step C
mmax = size(E, 2);
output = zeros(1, mmax.*M + (N-M));
w = sqrt(2*M/N).*sin((pi/N).*((0:N-1) + .5));
for m = 1:mmax-1
    output(:, m*M:m*M+N-1) = output(:, m*M:m*M+N-1) + w.*(hXwfi(:, m))';
end
end