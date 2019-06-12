## Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-

Reduce the acoustic noise in a noisy sound file..
## Getting Started & Prerequisites :

**Matlab Versions and Libraries :** 

* You need a MATLAB license and an install of MATLAB. .

* No Matlab toolboxes should be required for this program. 
           
## Execution & tests

* we implemented the functions that compte : 
  - Short-time Fourier transform ( MATLAB file : [STFT
  - Short-time Fourier Inverse transform

This program was tested on a Noisy sound file : [Mix.wav]() , it might not give good results using other files. since the algorithm considers that the noise is normally distributed. The detection of the **NOISE SPECTRUM** as part of the project should be done manually.However,an automatic method can be used to select the noisy region in an audio file ( this method was not treated in this project )

## Results ( Spectograms )

**Original noisy file :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_Noisy.jpg" >

**Spectral Subtraction Estimator , Half- Wave Rectification :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_noisy_phase1.jpg" >

**Residual Noise Reduction :**

<img src="https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./Spectrogram_clean.jpg" >

## Documentation & ressources : 

- You can find the article supporting this work in files : [Suppression of Acoustic Noise in Speech Using Spectral Subtraction](https://github.com/AissamDjahnine/Suppression-of-Acoustic-Noise-in-Speech-Using-Spectral-Subtraction-/blob/master/files./SuppressionofAcousticNoiseinSpeechUsingSpectral%20Substraction.pdf) explaining the mathemathical model and the method used.

## Authors

**Djahnine Aissam**  
- [Github Profile](https://github.com/AissamDjahnine)
- [Linkedin Profile](https://www.linkedin.com/in/aissamdjahnine/)


## Acknowledgments

* Part of this job was supported by : Valentin Marcel  :thumbsup:




