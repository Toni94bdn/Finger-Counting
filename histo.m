function [histogramout] = histo(imagein)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
histogramout=zeros(200,1);
sizein=size(imagein);
imagein=double(imagein);
for m=1:sizein(1)
       for n=1:sizein(2)
           
           k = round(imagein(m,n));
           
           histogramout(k+1) = histogramout(k+1)+1;
           
       end
end
histogramout=histogramout/(sizein(1)*sizein(2));


