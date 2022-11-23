[s4,fs]=audioread('m1c.wav');         % read the audio file and sample rate
x = s4;

ak=fft(x)/length(x);                  % obtain ak for the sampled signal 
f=[-length(x)/2:length(x)/2-1]*fs/length(x);          % frequency index

figure(1); 
subplot(311); plot(f,abs(fftshift(ak))); ylabel('|ak|'); grid; 

% plot magnitude of FS vs frequency index 
t=[0:length(s4)-1]/fs;            % time index
c=cos(2*pi*55000*t);            % carrier frequency is 10 kHz (10e3 = 10000) 
x = s4'.*c;              % x is the modulated signal    

ake=fft(x)/length(x); 
subplot(312); plot(f,abs(fftshift(ake))); ylabel('|ake|'); grid; 

[B2,A2] = butter(16, [ 0.1 ]);          %  filter 2 (bandpass)   N = 6    Wn = [0.05  0.2] 
y2 = filter(B2,A2,x');            % x is applied to filter 2 and y2 is the output
aky2 = fft(y2)/length(y2); 
subplot(313); plot(f,abs(fftshift(aky2))); ylabel('|aky2|'); grid; 