function [mask_out,num] = middle_axis(mask)


mask=imclose(mask,strel('square',9));
mask=imopen(mask,strel('square',5));
mask_cont=1-(mask-imerode(mask,strel('square',5)));
size_mask=size(mask_cont);
punt=zeros(1,size_mask(2));
mask_out=ones(size_mask);
mask_out_prw=ones(size_mask);
flag=0;
for i=1:size_mask(1) %604 Vertical
    for j=1:size_mask(2) %400 -->
        
        if(mask_cont(i,j)==0)
            
            flag=flag+1;
            punt(flag)=j;

        end
    end
    index=find(punt);
    npunts=length(index);
    n2=npunts;
    
    for n=1:n2-1
             if((punt(n+1)-punt(n))<22)
            mask_out_prw(i,round(mean([punt(n) punt(n+1)])))=0;
          end

    end
            flag=0;
        punt=zeros(1,size_mask(2));
end
for j=1:size_mask(2) %400 -->
    for i=1:size_mask(1) %604 Vertical
    
        if(mask_cont(i,j)==0)
            
            flag=flag+1;
            punt(flag)=i;

        end
    end
    index=find(punt);
    npunts=length(index);
    n2=npunts;
    
    for n=1:n2-1
          if((punt(n+1)-punt(n))<=28)

            mask_out_prw(round(mean([punt(n) punt(n+1)])),j)=0;
          end

    end
            flag=0;
        punt=zeros(1,size_mask(2));
end
 mask_out=imerode(1-((1-mask).*(1-mask_out_prw)),strel('square',11));
 mask_out=bwareaopen(1-mask_out,350);
 [~,num]=bwlabel(mask_out);

    
    
    

        

