N=30000;          % number of points
n=0:N-1;              % n index 
x = 4*cos( 2*pi*8000*n ) + 13*cos( 2*pi*15000*n ) + 7*cos( 2*pi*22000*n );
fs1=120e3;               % sampling frequency 1 (25 kHz)
x1=4*cos( 2*pi*8000*n/fs1 ) + 13*cos( 2*pi*15000*n/fs1 ) + 7*cos( 2*pi*22000*n/fs1 );          
% x is sampled using fs1 = x1[n] 
f1=[-N/2:N/2-1]*(fs1/N);          % frequency index for x1
figure(2) 
subplot(211); plot(f1, abs(fftshift(fft(x1))/length(x1)));    % plot magnitude spectrum of x1
grid; ylabel('|X1|'); xlabel('freuqency (Hz)'); 

fs2=12e3;         % sampling frequency 2 (200 kHz)
x1=4*cos( 2*pi*8000*n/fs2 ) + 13*cos( 2*pi*15000*n/fs2 ) + 7*cos( 2*pi*22000*n/fs2 ); 
f2=[-N/2:N/2-1]*(fs2/N);          % frequency index for x2 
            
subplot(212); plot(f2, abs(fftshift(fft(x2))/length(x2)));    % plot magnitude spectrum of x2
grid; ylabel('|X2|'); xlabel('freuqency (Hz)'); 