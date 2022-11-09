
[B2,A2] = butter(8, [0.025  0.15]);          %  filter 2 (bandpass)   N = 6    Wn = [0.05  0.2] 
[H2,fh] = freqz(B2,A2,1e3,fs);          %  Use 1000 points (1e3) to represent H2 
  
figure(6) 
subplot(211); plot(fh,abs(H2)); axis([0 fs/2 0 1.2]); grid; ylabel('|H2|');    % magnitude
subplot(212); plot(fh,angle(H2)); axis([0 fs/2 -pi pi]); grid; ylabel('< H2');  % phase
xlabel('f (Hz)'); 

%%%%%

y2=filter(B2,A2,x);            % x is applied to filter 2 and y2 is the output
figure(7) 
plot(t(1:800),y2(1:800)); grid;      % plot y2
ylabel('y2(t)'); xlabel('time (s)'); 