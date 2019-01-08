function [fscore, prec, rec, fs]=alg05(baseId, masks,basefinger)

tp = 0;
fp = 0;
fn = 0;
cd(baseId)
llista=dir('*.bmp');
N=length(llista);
fscore =zeros(1,N);
prec = zeros(1,N);
rec = zeros(1,N);

    for i=1:N
        tp=0;
        [~, finger]=middle_axis(masks{i});
        cd(basefinger)
        fid=fopen(strcat(strtok(llista(i).name,'.'),'.txt'),'w');
        fprintf(fid, '%f\n',finger);
        fclose(fid);
        clear fid
        cd(baseId)
        

        truefinger=str2double(llista(i).name(1));
        
        
        tp = eq(truefinger,finger);
        
             
                    
   prec(i) = tp;
   rec(i) = tp;
   fscore(i) = tp;
end
   clear finger
    fs = sum(fscore)/N;
cd ..
cd ..
cd ..
