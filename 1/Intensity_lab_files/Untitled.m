clc
imfinfo('lighthouse.jpg')
img = imread('lighthouse.jpg');
imshow(img)
figure;
imhist(img)
img_gray = rgb2gray(img);
figure;
imshow(img_gray)
figure;
imhist(img_gray)
%%
imfinfo('kids.tif')
[img2,map] = imread('kids.tif');
figure;
imshow(img2,map)
img2_gray = ind2gray(img2,map);
figure;
imshow(img2_gray)
%%
img3 = imread('marbles.tif');
figure;
imshow(img3)
n = 10
%n = 100
%n = 1000
[img3_ind, map] = rgb2ind(img3, n);
figure;
imshow(img3_ind,map)
%%
imfinfo('circle.png')
img4 = imread('circle.png');
img4_gray = rgb2gray(img4);
figure;
imshow(img4_gray)
level = graythresh(img4_gray)
img4_bw = im2bw(img4_gray,0.5491);%several attempts ...
figure;
imshow(img4_bw)
%%
imfinfo('breast.jpg')
img5 = imread('breast.jpg');
figure;
imshow(img5)
img5_gray = rgb2gray(img5);
figure;
imshow(img5_gray)
img5_neg = 255 - img5_gray;
figure;
imshow(img5_neg)
img5_neg_2 = imcomplement(img5_gray);
figure;
subplot(2,2,1),imshow(img5_gray),title('Gray scale')
subplot(2,2,3),imhist(img5_gray)
subplot(2,2,2),imshow(img5_neg_2),title('Binary')
subplot(2,2,4),imhist(img5_neg_2)
%%
imfinfo('house.jpg')
img6 = imread('house.jpg');
imhist(img6)
img6_gray = rgb2gray(img6);
img6_stertch = imadjust(img6_gray,stretchlim(img6_gray),[]);
figure;
subplot(2,2,1), imshow(img6_gray),title('Before')
subplot(2,2,3), imhist(img6_gray), title('Before')
subplot(2,2,2), imshow(img6_stertch),title('After')
subplot(2,2,4), imhist(img6_stertch), title('After')
%%
imfinfo('raider.png')
img7 = imread('raider.png');
figure;
imshow(img7)
gamma = 2
gamma2 = 0.3
%gamma = 0.001
img7_gamma = imadjust(img7,[],[],gamma);
figure;
imshow(img7_gamma)
img7_gamma2 = imadjust(img7,[],[],gamma2);
figure;
subplot(2,3,1),imshow(img7),title('Originl')
subplot(2,3,4), imhist(img7),title('Original')
subplot(2,3,2),imshow(img7_gamma ),title('gamma > 1')
subplot(2,3,5),imhist(img7_gamma ),title('gamma > 1')
subplot(2,3,3),imshow(img7_gamma2 ),title('gamma < 1')
subplot(2,3,6),imhist(img7_gamma2 ),title('gamma < 1')
%%
imfinfo('text.png')
img8 = imread('text.png');
img8_fft = fft2(img8);
magnitude = abs(img8_fft);
figure;
imshow(magnitude)
mean(mean(magnitude))
max(max(magnitude))
min(min(magnitude))
magnitude2 = abs(fftshift(img8_fft));
c = 255/(log(1+255));
D_range = c*log(1+double(magnitude2));
img8_Drange = mat2gray(D_range);
imshow(img8_Drange)
%%
imfinfo('flowers.jpg')
img9 = rgb2gray(imread('flowers.jpg'));
figure
subplot(1,2,1),imshow(img9)
subplot(1,2,2),imhist(img9)
img9_equ = histeq(img9);
figure;
subplot(1,2,1),imshow(img9_equ )
subplot(1,2,2),imhist(img9_equ )
%%

imfinfo('ribs_a.jpg')
imfinfo('ribs_b.jpg')
img10_a = imread('ribs_a.jpg');
img10_b = rgb2gray(imread('ribs_b.jpg'));
figure;
imshow(img10_a)
figure;
imshow(img10_b)
img10_b_enhanced = histeq(img10_b, imhist(img10_a));
figure;
subplot(2,3,1), imshow(img10_a),title('The Reference')
subplot(2,3,4), imhist(img10_a),title('The Reference')
subplot(2,3,2), imshow(img10_b),title('Before')
subplot(2,3,5), imhist(img10_b),title('Before')
subplot(2,3,3), imshow(img10_b_enhanced),title('After')
subplot(2,3,6), imhist(img10_b_enhanced),title('After')
%%
