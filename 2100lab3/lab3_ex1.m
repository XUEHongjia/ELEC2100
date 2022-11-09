[x,fs]=audioread('sample3c.wav');        % sampled periodic signal

t=[0:length(x)-1]/fs;                 % time index
  
figure(3); 
subplot(211); plot(t(1:800), x(1:800)); grid;      % Only show the first 400 points
ylabel('original'); 
sample3C = 0.2*cos(700*2*pi * t) + 0.5*cos(10500*2*pi * t) + 0.26*cos(35000*2*pi * t) ;
ylabel('synthesis using fft'); 
subplot(212); plot(t(1:800), sample3C(1:800)); grid;      % Only show the first 400 points

ak=fft(x)/length(x);                  % obtain ak for the sampled signal 
f=[-length(x)/2:length(x)/2-1]*fs/length(x);          % frequency index
a=(abs(ak)>0.001).*angle(ak);                        % phase of ak  
    
figure(4); 
subplot(211); plot(f,abs(fftshift(ak))); ylabel('|ak|'); grid;  % plot magnitude of FS vs frequency index 
subplot(212); plot(f,fftshift(a)); ylabel('< ak'); grid;    % plot phase of FS vs frequency index 
xlabel('f (Hz)') 