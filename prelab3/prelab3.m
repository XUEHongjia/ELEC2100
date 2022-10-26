%% FFT
fs=1e3;                                     % sampling frequency = 1e3 = 103
t=0:1/fs:1-1/fs;                          % time index
x=2*cos(200*pi*t-pi/4);                   % sampled x  
ak=fft(x)/length(x);                      % obtain the FS coefficients using fft 
% Compare the following expression (help fft) with the analysis equation (DTFS) 

akp=angle(ak).*(abs(ak)>0.001);           % phase of ak
% You may ignore the phase if the magnitude is too small, say less than 0.001. 
f=[0:length(x)-1]*fs/length(x);           % frequency index (0 to fs) 
figure(1); 
subplot(211); plot(f,abs(ak)); ylabel('|ak|');  grid;    % plot |ak|   (magnitude of FS) 
subplot(212); plot(f,akp); ylabel('< ak'); grid;     % plot < ak  (phase of FS) 
xlabel('frequency (Hz)');

f1=f-fs/2;              % shift the frequency index ( fs/2 to fs/2)
figure(2);               
subplot(211); plot(f1,fftshift(abs(ak))); 
ylabel('|ak|'); grid;   % plot |ak|  (magnitude of FS) 
subplot(212); plot(f1,fftshift(akp));
ylabel('< ak'); grid;     % plot < ak  (phase of FS) 
xlabel('frequency (Hz)'); 

%%%%%%%%%
%%  example1
[x,fs]=audioread('sample3.wav');        % sampled periodic signal
t=[0:length(x)-1]/fs;                 % time index
  
  figure(3); 
subplot(311); plot(t(1:400), x(1:400)); grid;      % Only show the first 400 points
ylabel('x(t)'); 
ak=fft(x)/length(x);                  % obtain ak for the sampled signal 
f=[-length(x)/2:length(x)/2-1]*fs/length(x);          % frequency index
a=(abs(ak)>0.001).*angle(ak);                        % phase of ak  
    
figure(4); 
subplot(211); plot(f,abs(fftshift(ak))); ylabel('|ak|'); grid;  % plot magnitude of FS vs frequency index 
subplot(212); plot(f,fftshift(a)); ylabel('< ak'); grid;    % plot phase of FS vs frequency index 
xlabel('f (Hz)') 

%%%%%%%%%
%% filter:
[B1,A1] = butter(6, 0.04);           %  filter 1 (lowpass)      N = 6    Wn = 0.04
[H1,fh] = freqz(B1,A1,1e3,fs);          %  Use 1000 points (1e3) to represent H1
[B2,A2] = butter(6, [0.05  0.2]);          %  filter 2 (bandpass)   N = 6    Wn = [0.05  0.2] 
[H2,fh] = freqz(B2,A2,1e3,fs);          %  Use 1000 points (1e3) to represent H2
figure(5) 
subplot(211); plot(fh,abs(H1)); axis([0 fs/2 0 1.2]); grid; ylabel('|H1|');    % magnitude
subplot(212); plot(fh,angle(H1)); axis([0 fs/2 -pi pi]); grid; ylabel('< H1');  % phase
xlabel('f (Hz)'); 
  
figure(6) 
subplot(211); plot(fh,abs(H2)); axis([0 fs/2 0 1.2]); grid; ylabel('|H2|');    % magnitude
subplot(212); plot(fh,angle(H2)); axis([0 fs/2 -pi pi]); grid; ylabel('< H2');  % phase
xlabel('f (Hz)'); 

y1=filter(B1,A1,x);             % x is applied to filter 1 and y1 is the output
y2=filter(B2,A2,x);            % x is applied to filter 2 and y2 is the output
figure(3) 
subplot(312); plot(t(1:400),y1(1:400)); grid;       % plot y1
ylabel('y1(t)'); 
subplot(313); plot(t(1:400),y2(1:400)); grid;      % plot y2
ylabel('y2(t)'); xlabel('time (s)');