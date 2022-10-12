[x,fs] = audioread('song2.wav');    % read audio file and sample rate 
x=x';            % transpose of x
   
  delay=2^16;                                  % delay (in terms of points with zero magnitude)
  y=[zeros(1,delay) x];                        % delayed version by adding zeros in front of x
  tx=[0:length(x)-1]/fs;        % time index of x
  ty=[0:length(y)-1]/fs;        % time index of y
  figure(2); 
  plot(tx,x); grid;          % plot x 
  hold on;  
  plot(ty,y,'r');           % plot y in the same figure(2)
  xlabel('time (sec)'); 
  legend('Original','Delayed'); 
  hold off; 
z=[x zeros(1,delay)] + y;      % original and delayed are added together 
% Two matrices must have the same length before adding them together. 
% Certain number of zeros are added to original x so as to make it have the same length as y. 
  sound(x, fs);          % hear the original 
sound(y, fs);          % hear the delayed 
sound(z, fs);          % hear the sum of x and y 