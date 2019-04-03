function output = phaseVocoder(x,Fs,N,M,a)
%% Step A
[E, P] = stft_analysis(x,Fs,N,M);

%% Step B
mmax = size(E, 2);
Lmax = (floor((mmax-2)/a) - ceil(1/a)-1);
l = 1:Lmax;
t = 1+a*(l-1);
E1(:,l) = (ceil(t)-t).*E(:,floor(t)) + (1-ceil(t) + t).*E(:,ceil(t));

%% Step C
kmax = size(P, 1);
k = (1:kmax)'; 
D = mod((diff(P,1,2) - 2*pi*k*M/N), 2*pi);

%% Step D
tl = 1+a*(l-1/2);
D1 = (ceil(tl+.5)-tl-.5).*D(:,floor(tl+.5)) + (1-ceil(tl+.5)+tl+.5).*D(:,ceil(tl+.5));
P1 = zeros(size(D1,1),Lmax);
P1(:,1) = P(:,1);

for i=2:Lmax
    P1(:,i) = P1(:,i-1) + D1(:,i) + 2.*pi.*k.*M/N;
end

%% Step E
output = stft_synthesis(E1, P1, N,M);
end

