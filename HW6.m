a = [ 100, -100 ];
b = [ 1, 4, 404 ];
H = tf( [100, -100], [ 1, 4, 404] );
h = pzplot(H);
grid

H1 = tf( a, b );
figure(2);
bode(H1);
