x=[2, 0, 7, 6, 1, 3, 2,5];  	 	 	 		% input x 
nx=0:7;  
 	 	 	 	 	% n index of x 
h1 =[1 0 1]; 	 	 	 	 	% impulse response h 
nh1 =2:4;  
 	 	 	 	 	% n index of h 
  h2 = [1, 0, 0, 0,1];
  nh2 = 8:12;					
y1=conv(x,h1); 	 	 	 	 	% obtain the output y using convolution 
y2 = conv(y1, h2);  
 	 	ny2 = 10:23; 	
	 	 	 	% n index of y 
% min(ny) = min(nx) + min(nh)  	 	3 = 0 + 3 
% max(ny) = max(nx) + max(nh) 	 	7 = 2 + 5 
% Each time‐shifted impulse of the impulse response can be regarded as a delay unit. 
h = conv(h1,h2);
nh = 10:16;
 
figure(1); 
 	subplot(311); stem(nx,x); ylabel('x[n]'); grid; axis([-1 8 0 9]); 
 	subplot(312); stem(nh,h,'red'); ylabel('h[n]'); grid; axis([5 20 0 2]); 
 	subplot(313); stem(ny2,y2,'green'); ylabel('y[n]'); grid; 
axis([5 25 0 20]); xlabel('n'); 
