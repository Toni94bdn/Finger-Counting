function [fscore, prec, rec, fs]=alg04(basemask, masks)

tp = 0;
fp = 0;
fn = 0;





cd(basemask)
llista=dir('*.bmp');
N=length(llista);
fscore =zeros(1,N);
prec = zeros(1,N);
rec = zeros(1,N);
for i=1:N
    tp=0;
    fp=0;
    fn=0;
        truemask=double(imread(llista(i).name));
        mask=masks{i};
        [f,c]=size(mask);
        for m=1:f
            for n=1:c
                if(truemask(m,n)==0 && mask(m,n)==0)
                    tp = tp + 1;
                end
                if(truemask(m,n)==0 && mask(m,n)==1)
                    fn = fn + 1;
                end
                if(truemask(m,n)==1 && mask(m,n)==0)
                    fp = fp + 1;
                end
              
            end                 
        end
        prec(i) = tp /(tp+fp);
        rec(i) = tp / (tp+fn);
        fscore(i) = (2*prec(i)*rec(i))/(prec(i)+rec(i));
        clear mask

end
fs = sum(fscore)/N;

cd ..
cd ..
cd ..
