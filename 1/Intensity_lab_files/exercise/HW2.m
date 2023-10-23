clc
fuzzy_system =readfis('HW2');
imfinfo('fig.bmp')
[img, map] = imread('fig.bmp');
img_gray = ind2gray(img, map);

dims = size(img_gray);
rows_num = dims(1);
clmns_num = dims(2);

output = ones(rows_num,clmns_num);
for i = 1:clmns_num
    output(:,i) = evalfis(double(img_gray(:,i)), fuzzy_system);
end
img_eval = mat2gray(output);

img_stertch = imadjust(img_gray,stretchlim(img_gray),[]);

figure;
subplot(2,2,1), imshow(img_eval),title('Method 1')
subplot(2,2,3), imhist(img_eval),title('Method 1')
subplot(2,2,2), imshow(img_stertch),title('Method 2')
subplot(2,2,4), imhist(img_stertch),title('Method 2')