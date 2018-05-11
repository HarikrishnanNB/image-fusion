%% Author Harikrishnan NB, dtd:29-09-2016
close all;
clear all;
clc;

A=imread('Time1.bmp');
B=imread('Time2.bmp');

A=im2double(A);
B=im2double(B);

C=[A(:) B(:)];
N=length(A(:));
CAA=(1/(N-1))*sum(   (A(:)-mean(A(:))).*(A(:)-mean(A(:))));
CAB=(1/(N-1))*sum(   (A(:)-mean(A(:))).*(B(:)-mean(B(:))));
CBA=(1/(N-1))*sum(   (B(:)-mean(B(:))).*(A(:)-mean(A(:))));
CBB=(1/(N-1))*sum(   (B(:)-mean(B(:))).*(B(:)-mean(B(:))));

D=[CAA CAB;CBA CBB];




[e_vector e_v]=eig(D);
e_value=eig(D);

i=1;
if e_value(i)>e_value(i+1)
    vect=e_vector(:,i);
else
    vect=e_vector(:,i+1);
end
%Img_Fus=vect(1)*A+vect(2)*B;
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
saveas(gcf,'imfusion.jpg')




