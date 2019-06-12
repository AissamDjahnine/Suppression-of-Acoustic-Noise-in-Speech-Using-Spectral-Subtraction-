function [x, t] = iSTFT(X_m, wlen, hop, nfft, fs)

% [x, t] = itfct(stft, wlen, hop, wlen)
% Short term Fourier inverse transform with overlapp-add (OLA)
%% Inputs :
% X_m       Spectrum Matrix STFTCT (FxT)
% wlen      size of the observation window ( Samples)
% hop       Step ( Samples )
% nfft      Frequency points for the Fourier Transform
% fs        Sampling frequency (Hz)
%
%% Outputs :
% x_v       Temporal signal (1xT)
% t_v       Duration of the signal in seconds (s)

% initialize variables
coln    = size(X_m, 2);
xlen    = nfft + (coln-1)*hop;
x       = zeros(1, xlen);
x2      = x;

% form a hamming window
win = hamming(wlen);

% perform IFFT and weighted-OLA
for b = 0:hop:(hop*(coln-1))
        
    % compute inverse FFT
    xprim = ifft(X_m(:, 1+b/hop), wlen);

    % compute weighted-OLA
    x((b+1):(b+wlen)) = x((b+1):(b+wlen)) + (xprim.*win)';
    x2((b+1):(b+wlen)) = x2((b+1):(b+wlen)) + (win.^2)';
    
end

% normalize OLA by window
x = x./x2;

% calculate the time vector
t = (0:length(x)-1)/fs;

end