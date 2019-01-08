function [mask_out]= alg02(image_in, hist_pell)

size_in=size(image_in);
mask_out=zeros(size_in);


h=find(hist_pell>=(max(hist_pell)/17));
th1=h(1);
th2=h(end);


hist_temp=zeros(200,1);
%La imatge d'entrada amb zero padding (tenint en compte que l'element estructurant és de LexLe)
size_e=[3 3]; %variar les dimensions de l'element estructurant
af=floor((size_e(1)-1)/2);
imag_in_zp=zeros(size_in+af*2);
imag_in_zp((af+1):(af+size_in(1)),(af+1):(af+size_in(2)))=image_in;



for i=1:size_in(1)
    for j=1:size_in(2)
        
          hist_temp=histo(imag_in_zp((i):(i+size_e(1)-1),(j):(j+(size_e(2))-1)));
            indmax=find(hist_temp==max(hist_temp));

         if(((indmax(1))>=th1)&&(indmax(1)<=th2))
             mask_out(i,j)=0;
         else
             mask_out(i,j)=1;
         end
    end
end



