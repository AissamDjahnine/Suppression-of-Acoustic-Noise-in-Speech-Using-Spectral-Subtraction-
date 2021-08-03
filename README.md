## Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-

Reduce the acoustic noise in a noisy sound file..
## Getting Started & Prerequisites :

**Matlab Versions and Libraries :** 

* You need a MATLAB license and an install of MATLAB. .

* No Matlab toolboxes should be required for this program. 
           
## Execution & tests
You find in the files :
* Audio file Mix.wav : a noisy file
* we implemented the functions that compte : 
  - Short-time Fourier transform ( MATLAB file : [STFT.m](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/STFT.m) )
  - Short-time Fourier Inverse transform ( MATLAB file :[iSTFT](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/iSTFT.m) )

Since the algorithm considers that the noise is normally distributed. The detection of the **NOISE SPECTRUM** as part of the project should be done manually. However, an automatic method can be used to select the noisy region in an audio file (this method was not treated in this project)

## Results ( Spectograms )

**Original noisy file :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_Noisy.jpg" >

* Listen to the original file: [click here to downlaod the .wav file](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./mix.wav)

**Spectral Subtraction Estimator , Half- Wave Rectification :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_noisy_phase1.jpg" >

*Listen to the resultfile ( Phase 1 )  : [click here to downlaod the .wav file](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Mix_Noisy_phase1.wav)

**Residual Noise Reduction :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_clean.jpg" >

* Listen to the final result : [click here to downlaod the .wav file](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Mix_clean.wav)

## Documentation & ressources : 

- You can find the article supporting this work in files : [Suppression of Acoustic Noise in Speech Using Spectral Subtraction](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./SuppressionofAcousticNoiseinSpeechUsingSpectral%20Substraction.pdf) explaining the mathemathical model and the method used.



