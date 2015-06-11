function [index] = bitswap(arg, lenght)
mask = 1;
index = 0;
n=log2(lenght);

for i=1:n
    index = bitshift(index,1);
    if(bitand(arg,mask))
        index = index+1;
    end
    mask = bitshift(mask,1);
end

end