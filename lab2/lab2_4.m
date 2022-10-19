i2=imread('142.jpg'); % read the file
i2_1 = i2(1:800, 1:558, 1);
i2_2 = i2(1:800, 1:558, 2);
i2_3 = i2(1:800, 1:558, 3);
figure(3); 
imshow(i2); % display the image
h1 = [0, -1, 0;
        -1, 5, -1;
        0, -1, 0];

y1_1=conv2( i2_1, h1, 'same'); % perform 2‐D convolution using 1‐D filter
y1_2=conv2( i2_2, h1, 'same');
y1_3=conv2( i2_3, h1, 'same');
y1 = y1_1;
y1(:,:,2) = y1_2;
y1(:,:,3) = y1_3;

figure(4); imshow(uint8(y1)); 

h2=[0.05, 0.15, 0.2, 0.2, 0.2, 0.15, 0.05]; % impulse response (10‐by‐10, 2‐D filter) 
y2_1=conv2(h2', h2, i2_1, 'same'); % perform 2‐D convolution using 2‐D filter
y2_2=conv2(h2', h2, i2_2, 'same');
y2_3=conv2(h2', h2, i2_3, 'same');
y2 = y2_1;
y2(:,:,2) = y2_2;
y2(:,:,3) = y2_3;
figure(5); imshow(uint8(y2)); % map values into [0:255] before showing the figure