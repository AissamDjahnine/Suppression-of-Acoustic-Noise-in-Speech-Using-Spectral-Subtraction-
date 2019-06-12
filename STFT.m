function [Spectrum_window,f,t] = STFT(Nwin,Nhop,fs,x)

%%%% this function computes the short term fourier transform of a
%input signal with windowing parameters u fenêtrage
% Nwin, Nhop et fs Sampling frequency

x = x(:);
nfft = Nwin; 

NUP = ceil( ( 1+nfft )/2 ); Trames = 1+fix((length(x)-Nwin)/Nhop);

%% Window used : Hamming 
win = hamming(Nwin);
Spectrum_window = zeros(NUP, Trames); 

for i = 0:Trames-1
    xw = x(1+i*Nhop : Nwin+i*Nhop).*win;    % Windowing the signal  
    X = fft(xw, nfft);                      % Compute the STFT of the "Windowed" signal 
    Spectrum_window(:, i+1) = X(1:NUP);     % Filling the Spectrum Matrix
end

%calculate the time,frequency vectors : 
t = (Nwin/2:Nhop:Nwin/2+(Trames-1)*Nhop)/fs;
f = (0:NUP-1)*fs/nfft;

end