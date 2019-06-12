clear all,close all,clc

%%%%%%%%%%%%% Reading the audio signal %%%%%%%%%%%%
filename='mix.wav';
[x,fs]=audioread(filename);

%% variables :  
%%% Windows parametres :
Nwin = 1024;Nhop=Nwin/2;nfft = Nwin;
%%% Signal size :
Length_X = length(x);Trames = 1+fix((Length_X-Nwin)/Nhop);

%% Short-time Fourier transform : 
[STFT_f, f, t] = STFT(Nwin,Nhop,fs,x);

%% vector T (time) and F (frequency) : 
T=t;F=f;

%% Noisy file Spectrogram : 
figure,imagesc(t,f,log(abs(STFT_f))),axis xy,xlabel('t(secondes)'),ylabel('frequency(Hz)')
title(' Spectrogram of "Mix" ( signal + noise )'),colormap jet

%% Short-time Fourier Inverse transform : 
[x_itfct, t] = iSTFT(STFT_f, Nwin, Nhop, Nwin, fs);

%% Module + Phase
sound(real(x),fs)
h=msgbox('The noisy sound was played , tap OK to start processing ( Listen the first phase ) ');
uiwait(h,20);
if ishandle(h) == 1
    delete(h);
end
%% Noise Supression : 
% Note : we observed that the noise is at the beginning of the file "Mix" 
%so we could use the first trame as a sample of the noise spectrum

% locating the noise spectrum depends on the file treated , an automatic
% method can be used in order to determinate the noisy parts of the signal.

[STFT_Band,f,t]=STFT(Nwin,Nhop,fs,x(1:Nwin) );      % Short-time Fourier transform of first band   
%% Spectral Subtraction Estimator : 
u = mean( abs(STFT_Band) ); % E [ N(ejw) ] 
H = 1 - (u./abs(STFT_f));     

%% Half- Wave Rectification : 
Hr = (H + abs(H))/2;
Xf = Hr.*STFT_f;

%% Phase 1 : Spectrogram of noisy file :
figure
imagesc(T,F,log( abs(Xf))),axis xy,xlabel('t(secondes)'),ylabel('frequency(Hz)')
title(' Spectrogram of "Mix" after( Half- Wave Rectification )'),colormap jet

%% Noisy sound file ( Phase 1 ) : 
[Xs, t] = iSTFT(Xf, Nwin, Nhop, Nwin, fs);
sound(real(Xs),fs);
audiowrite('Mix_Noisy_phase1.wav',Xs,fs)
h=msgbox('Mix_noisy_phase1 sound was played , tap OK to listen to the final clean version');
uiwait(h,20);
if ishandle(h) == 1
    delete(h);
end

%% Residual Noise Reduction :
Nr = STFT_Band - u.*exp(i*angle(STFT_Band));
max_Nr = max(abs(Nr));
S_res=zeros(size(Xf));

for i=1:size(STFT_Band,1)
    for j=2:Trames-1
        if abs(Xf(i,j))<max_Nr
            vec = [abs(Xf(i,j-1)) abs(Xf(i,j)) abs(Xf(i,j+1))];
            m = min(vec);
            Xf(i,j)= m;
        end
    end
end

%% Spectrogram of output sound file :
figure
imagesc(t,f,log(abs(Xf))),axis xy,xlabel('t(secondes)'),ylabel('frequence(Hz)')
title(' Spectrogram of clean "Mix" ( Residual Noise Reduction )'),colormap jet
% lecture du signal debruité ( 1 er Phase ) : 
[Xs2, t] = iSTFT(Xf, Nwin, Nhop, Nwin, fs);
sound(real(Xs2),fs);
audiowrite('Mix_clean.wav',Xs2,fs)