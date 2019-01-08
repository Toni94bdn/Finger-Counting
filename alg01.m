function [histA]=alg01 (base, basemask)

%//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//
%\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
%//\\//\\//\\//\Algoritme 1:  Toni Forcada & Gerard Casas//\\//\\//\\//\\//
%\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
%//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//
% ----------------------------Inicialització-------------------------------
histA=zeros(200,1);
leidos=0;
cd(base)
llistaim=dir('*.jpg');
Nim=length(llistaim);
cd(basemask)
llistamask=dir('*.bmp');


for n=1:Nim
        cd(base)
        im=imread(llistaim(n).name);
        imlab=rgb2lab(im);
        cd(basemask)
        mask=double(imread(llistamask(n).name));
        cd ..
        cd ..

% -----------------------Càlcul dels dos histogrames-----------------------

    imA = double(imlab(:,:,3));
    imA=imA+100;
    [f,c]=size(imA);
    for m=1:f
       for n=1:c
 
           if(mask(m,n)==0)
           leidos=leidos+1;
           
           l =round(imA(m,n));
           histA(l+1) = histA(l+1)+1;
           end
       end
    end

end

%--------------Normalització-----------------------------------------------
histA=histA/(leidos);
%--------------------------------------------------------------------------



