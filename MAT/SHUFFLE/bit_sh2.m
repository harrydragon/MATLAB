function [vect, time] = bit_sh2(x)
% bitshuffle_2 wersja
tic
n=length(x);
vect=zeros(1,n);
q=log2(n);
for i=1:n
    mask = 1;
    index = 0;    
        for j=1:q
             index = bitshift(index,1);
             if(bitand(i-1,mask))
                 index = index+1;
             end
            mask = bitshift(mask,1);
        end    
    vect(i)=x(index+1);
end
time = toc;
end
