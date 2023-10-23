clc
close all
se = strel('square',3);

imfinfo('pcb.png');
img = imread('pcb.png');

img_bw = im2bw(img);


img_dil = imdilate(img_bw, se);


img_ero = imerode(img_bw, se);

figure;
subplot(1,3,1), imshow(img_bw), title('The original')
subplot(1,3,2), imshow(img_dil), title('After Dilation')
subplot(1,3,3), imshow(img_ero), title('After erosion')
%%
clc
close all

imfinfo('Rectangle.bmp')
img = imread('Rectangle.bmp');

img_bw = im2bw(img);

img_open = imopen(img_bw,se);

img_close = imclose(img_bw,se);

figure;
subplot(1,3,1), imshow(img_bw), title('The original')
subplot(1,3,2), imshow(img_open), title('After Opening')
subplot(1,3,3), imshow(img_close), title('After Closing')

se2 = strel('square', 10);
img_open2 = imopen(img_bw,se2);

img_close2 = imclose(img_open2,se2);

figure;
subplot(1,3,1), imshow(img_bw), title('The original')
subplot(1,3,2), imshow(img_open2), title('After suitable Opening')
subplot(1,3,3), imshow(img_close2), title('After suitable Closing')


%%
clc
close all

imfinfo('squares.bmp')

[img, map] = imread('squares.bmp');

img_bw = im2bw(img);


se  = [0 1 -1 
       1 1 -1 
       -1 -1 -1];
img_hm = bwhitmiss(img_bw, se); 

im_new = img_bw - img_hm;

figure;
subplot(1,3,1), imshow(img_bw), title('The original')
subplot(1,3,2), imshow(img_hm), title('After Hit&Miss')
subplot(1,3,3), imshow(im_new), title('The Subtract')
%%
clc
close all

imfinfo('circlesm.tif')

img = imread('circlesm.tif');

img_bw = im2bw(img);

n=5;
img_thin = bwmorph(img_bw,'thin',n);

im_new = bwmorph(img_bw,'thin',15);

img_thin_inf = bwmorph(img_bw,'thin',inf);

figure;
subplot(2,2,1), imshow(img_bw), title('The original')
subplot(2,2,2), imshow(img_thin), title('After Thinning with 5')
subplot(2,2,3), imshow(im_new), title('After Thinning with 15')
subplot(2,2,4), imshow(img_thin_inf), title('After Thinning with infinity')
%%
clc
close all

img_thck = bwmorph(img_bw,'thicken',n);

img_new = bwmorph(img_bw,'thicken',15);

img_thck_inf = bwmorph(img_bw,'thicken',inf);

figure;
subplot(2,2,1), imshow(img_bw), title('The original')
subplot(2,2,2), imshow(img_thck), title('After Thickening with 5')
subplot(2,2,3), imshow(img_new), title('After Thickening with 15')
subplot(2,2,4), imshow(img_thck_inf), title('After Thickening with infinity')
%%
clc
close all

imfinfo('lines.png')
imgex = imread('lines.png');

imgex_bw = im2bw(imgex);

ex_se = [0 0 0 0 0
         1 1 1 1 1
         1 1 1 1 1
         0 0 0 0 0];
imgex_open = imopen(imgex_bw,ex_se);


figure;
subplot(1,2,1), imshow(imgex_bw), title('The original')
subplot(1,2,2), imshow(imgex_open), title('After Opening')
%%
clc
close all

imfinfo('hardware.tif')
imgex = imread('hardware.tif');

imgex_bw = im2bw(imgex, 0.9);

imgex_new = 1 - imgex_bw;

     
imgex_thin = bwmorph(imgex_new,'thin',1); 

imgex_fin = imgex_new - imgex_thin;

figure;
subplot(1,3,1), imshow(imgex_bw), title('The original')
subplot(1,3,2), imshow(imgex_new), title('First coversion')
subplot(1,3,3), imshow(imgex_fin), title('The Outlining')

img2 = edge(imgex_bw,'canny');

figure;
subplot(1,2,1), imshow(imgex_fin), title('First method')
subplot(1,2,2), imshow(img2), title('Using Canny filter')


%%
clc
close all

imfinfo('withserif.tif')
[imgex, map] = imread('withserif.tif');

imgex_bw = im2bw(imgex, map);


imgex_new = 1 - imgex_bw;


se1 = [1 1 1 1 1 1 1 1 1 1];

ima =imerode(imgex_new,se1);

se2 = [1
       1
       1
       1
       1
       1
       1
       1
       1
       1
       1
       1
       1];

imb = imerode(imgex_new,se2);

imc = imgex_new - ima - imb;

imd = imgex_new - imc;

se3 =strel('square',6);
ime = imdilate(imd,se3);

se4 = [0 0 0
       -1 1 1
       0 0 0];
   
imf = bwhitmiss(ime,se4);

img = ime - imf;

se5 = [0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 1 1 1 1 1 1 1
       0 0 0 0 0 0 0 0];

imh = imerode(img,se5);

se6 = strel('disk',3);

imj = imdilate(imh,se6);

figure;
subplot(2,2,1), imshow(imgex_bw), title('The Original')
subplot(2,2,2), imshow(imgex_new), title('After conversion')
subplot(2,2,3.5), imshow(imj), title('The result')

%%
clc
close all

imfinfo('coins.png')
imgex = imread('coins.png');

imgex_bw = im2bw(imgex);

se = strel('disk',5);

se2 = strel('disk',22);

imgex_close = imclose(imgex_bw,se);

ima = imerode(imgex_close,se2);

imb = bwmorph(ima,'thin',50);


se3 = [-1 -1 0
       -1 1 0
       -1 -1 -1];

imc = bwhitmiss(imb,se3); 

s = size(imc);
count = 0;

for i=1:s(1)
    for j=1:s(2)
    
        if(imc(i,j)==1)
            count = count +1;
        end
        
        
    end

    
end


disp('The number of coins is:'); 
disp(count);

figure;
subplot(2,2,1), imshow(imgex_bw), title('After first conversion')
subplot(2,2,2), imshow(imgex_close), title('After second conversion')
subplot(2,2,3), imshow(ima), title('After third conversion')
subplot(2,2,4), imshow(imb), title('After fourth conversion')

figure;
subplot(1,2,1), imshow(imgex), title('The Original')
subplot(1,2,2), imshow(imc), title('The result')
