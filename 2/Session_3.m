clc
clear all
close all
imfinfo('im10.png')
img = imread('im10.png');
img_gray = rgb2gray(img);
%img_gray_gnoise = imnoise(img_gray,'gaussian', 0,0.075);
%img_gray_spnoise = imnoise(img_gray,'salt & pepper', 0.25);
figure;
subplot(1,3,1), imshow(img_gray), title('The original image');
%subplot(1,3,2), imshow(img_gray_gnoise), title('Image with Gaussian noise');
%subplot(1,3,3), imshow(img_gray_spnoise), title('Image with salt & pepper noise');
%%
close all
h = fspecial('average', [2 2]);
gaus_filter_av = imfilter(img,h);
sap_filter_av = imfilter(img,h);

%%
close all
gaus_filter_med = medfilt2(img, [5 5]);
sap_filter_med = medfilt2(img, [5 5]);

%%
clc
close all
gaus_filter_ad = wiener2(img, [7 7]);
sap_filter_ad = wiener2(img, [7 7]);

%%
clc
close all
subplot(2,4,1), imshow(img_gray), title('Gaussian Noise')
subplot(2,4,2), imshow(gaus_filter_av), title('Avg')
subplot(2,4,3), imshow(gaus_filter_med), title('Med')
subplot(2,4,4), imshow(gaus_filter_ad), title('Adap')
%subplot(2,4,5), imshow(img_gray_spnoise), title('S&P Noise')
subplot(2,4,6), imshow(sap_filter_av), title('Avg')
%subplot(2,4,7), imshow(sap_filter_med), title('Med')
subplot(2,4,8), imshow(sap_filter_ad), title('Adap')
%%
close all
imfinfo('football.jpg');
img = imread('football.jpg');
img_g = rgb2gray(img);
img_fourier = fft2(img_g );

c = 255/(log(1+255));
D_range = c*log(1+double(abs(fftshift((img_fourier)))));
img_fou = mat2gray(D_range);
figure;
imshow(img_fou)

H = lpfilter('ideal',256, 320, 5*320/100);
figure;
imshow(abs(fftshift(H)))

img_filt = img_fourier .* H;

IF = fftshift(img_filt);
c2 = 255/(log(1+255));
D2_range = c2*log(1+double(abs(IF)));
img_filt2 = mat2gray(D2_range);
figure;
imshow(img_filt2)

i_four = ifft2(img_filt);
after_filter = mat2gray(i_four);
figure;
imshow(after_filter)
%%
close all
H = hpfilter('ideal',256, 320, 5*320/100);
img_filt_h = img_fourier .* H;
IF = fftshift(img_filt_h);
c2 = 255/(log(1+255));
D2_range = c2*log(1+double(abs(IF)));
img_filt2 = mat2gray(D2_range);
figure;
imshow(img_filt2)
i_four2 = ifft2(img_filt_h); 
after_filt_h = mat2gray(i_four2);
figure;
imshow(after_filt_h)
%%
close all
imfinfo('wheel.png')
img = imread('wheel.png');
[img_edge, threshout] = edge(img, 'sobel');
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(img_edge), title('Edge Detection')

disp(threshout);

imedg1 = edge(img, 'sobel',0.12);
imedg2 = edge(img, 'sobel',0.5);
imedg3 = edge(img, 'sobel',0.03);

figure;
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(imedg1), title('Edge Detection 0.12')
figure;
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(imedg2), title('Edge Detection 0.5')
figure;
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(imedg3), title('Edge Detection 0.03')
%%
close all
h = fspecial('sobel');

img_filt_y_pos = imfilter(img,h);
img_filt_y_neg = imfilter(img,-1*h);
img_filt_x_pos = imfilter(img,h');
img_filt_x_neg = imfilter(img,-1*h');

img_filt_all = img_filt_y_pos + img_filt_y_neg + img_filt_x_pos + img_filt_x_neg;

figure;
imshow(img_filt_all)
%%
close all

h1 = [0 -1 -1; 2 0 -2; 1 1 0];
h2 = [1 1 0; 2 0 -2; 0 -1 -1]
h3 = [0 1 1; -2 0 2; -1 -1 0]
h4 = [-1 -1 0; -2 0 2; 0 1 1]
h5 = [0 -2 -1; 1 0 -1; 1 2 0]
h6 = [-1 -2 0; -1 0 1; 0 2 1]
h7 = [0 2 1; -1 0 1; -1 -2 0]
h8 = [1 2 0; 1 0 -1; 0 -2 -1]

img_filt_y_pos_45 = imfilter(img,h1);
img_filt_y_neg_45 = imfilter(img,h2);
img_filt_x_pos_45 = imfilter(img,h3);
img_filt_x_neg_45 = imfilter(img,h4);
img_filt_y_pos2_45 = imfilter(img,h5);
img_filt_y_neg2_45 = imfilter(img,h6);
img_filt_x_pos2_45 = imfilter(img,h7);
img_filt_x_neg2_45 = imfilter(img,h8);

img_filt_all_45 = img_filt_y_pos_45 + img_filt_y_neg_45 + img_filt_x_pos_45 + img_filt_x_neg_45 + img_filt_y_pos2_45 + img_filt_y_neg2_45 + img_filt_x_pos2_45 + img_filt_x_neg2_45 ;

figure;
imshow(img_filt_all_45)

%%
close all
[img_edge2, threshout2] = edge(img, 'canny');

figure;
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(img_edge2), title('Edge Detection with canny')

disp(threshout2);
%%
close all
[img_edge3, threshout3] = edge(img, 'log');

figure;
subplot(1,2,1), imshow(img), title('The original')
subplot(1,2,2), imshow(img_edge3), title('Edge Detection with log method')

disp(threshout3);
%%
close all
imfinfo('butterfly.jpg')
img = imread('butterfly.jpg');
img_gray = rgb2gray(img);

img_gauss_noise = imnoise(img_gray, 'gaussian');

[img_edge_sobel, thr1] = edge(img_gray, 'sobel');
[img_edge_canny, thr2]= edge(img_gray, 'canny');
[img_edge_log, thr3] = edge(img_gray, 'log');

[img_noise_edge_sobel, thrnoise1] = edge(img_gauss_noise, 'sobel');
[img_noise_edge_canny,thrnoise2] = edge(img_gauss_noise, 'canny');
[img_noise_edge_log,thrnoise3] = edge(img_gauss_noise, 'log');

disp(thr1);
disp(thr2);
disp(thr3);

disp(thrnoise1);
disp(thrnoise2);
disp(thrnoise3);


%%
close all
img_edge_sobel = edge(img_gray, 'sobel', 0.02);
img_edge_canny = edge(img_gray, 'canny',[0.02 0.04] );
img_edge_log= edge(img_gray, 'log',0.0009);

img_noise_edge_sobel = edge(img_gauss_noise, 'sobel',0.18);
img_noise_edge_canny = edge(img_gauss_noise, 'canny',[0.1 0.2]);
img_noise_edge_log = edge(img_gauss_noise, 'log', 0.0115);

figure;
subplot(2,4,1), imshow(img_gray), title('The Original')
subplot(2,4,2), imshow(img_edge_sobel), title('sobel')
subplot(2,4,3), imshow(img_edge_canny), title('canny')
subplot(2,4,4), imshow(img_edge_log), title('log')
subplot(2,4,5), imshow(img_gauss_noise), title('Gaussian Noise')
subplot(2,4,6), imshow(img_noise_edge_sobel), title('sobel')
subplot(2,4,7), imshow(img_noise_edge_canny), title('canny')
subplot(2,4,8), imshow(img_noise_edge_log), title('log')
