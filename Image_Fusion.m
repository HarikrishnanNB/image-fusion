%% Author Harikrishnan NB, dtd:29-09-2016
close all;
clear all;
clc;

A=imread('Time1.bmp');
B=imread('Time2.bmp');

A=im2double(A);
B=im2double(B);

C=[A(:) B(:)];
D=cov(C);

[e_vector e_v]=eig(D);
e_value=eig(D);

i=1;
if e_value(i)>e_value(i+1)
    vect=e_vector(:,i);
else
    vect=e_vector(:,i+1);
end

%Img_Fus=(vect(1)*A+vect(2)*B);

Img_Fus=(vect(1)*A+vect(2)*B)/sum(vect);

subplot(131);
imshow(A);
title('Image 1');

subplot(132);
imshow(B);
title('Image 2');

subplot(133);
imshow(Img_Fus);
title('Image Fusion');




