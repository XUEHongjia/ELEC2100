sam = 315;
freq = 160;
t = (0:1/(sam*freq):5/freq);
y = 8*exp(2*pi*t*freq*1i);
mag_y = abs(y);
real_y = real(y);
imag_y = imag(y);
phase_y = angle(y);

p3 = plot(t,mag_y);
p3.Color = "blue";
xlabel('time')
ylabel('Magnitude of the Signal')

p2 = plot(t,real_y);
p2.Color = "magenta";
xlabel('time')
ylabel('Real Part of the Signal')

p1 = plot(t,imag_y);
p1.Color = "magenta";
xlabel('time')
ylabel('Imaginary Part of the Signal')

p = plot(t,phase_y);
p.Color = "blue";
xlabel('time')
ylabel('Phase of the Signal')

