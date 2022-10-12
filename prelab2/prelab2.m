x=[1 2 3];           % input x 
nx=0:2;           % n index of x
h=[2 1 2];          % impulse response h 
nh=3:5;           % n index of h
y=conv(x,h)          % obtain the output y using convolution
ny=3:7;           % n index of y
   
% min(ny) = min(nx) + min(nh)      3 = 0 + 3 
% max(ny) = max(nx) + max(nh)    7 = 2 + 5 
% Each time‐shifted impulse of the impulse response can be regarded as a delay unit. 
figure(1); 
  subplot(311); stem(nx,x); ylabel('x[n]'); grid; axis([-1 8 0 4]);
  subplot(312); stem(nh,h); ylabel('h[n]'); grid; axis([-1 8 0 4]);
  subplot(313); stem(ny,y); ylabel('y[n]'); grid; axis([-1 8 0 11]);
xlabel('n'); 