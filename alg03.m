function [masks]=alg03(hist_pell, base,basemask)
cd(base)
llista=dir('*.jpg');
N=length(llista);

clear masks

for n=1:N
        cd(base)
        im=imread(llista(n).name);
        imylab=rgb2lab(im);
        image=double(imylab(:,:,2));
        imagein=image+100;
        


          masks{n}=bwareaopen(imopen(1-bwareaopen(1-logical(alg02(imagein, hist_pell)),500),strel('square',3)),1000);
        cd(basemask)
        
        imwrite(masks{n},llista(n).name);

end
   
end

