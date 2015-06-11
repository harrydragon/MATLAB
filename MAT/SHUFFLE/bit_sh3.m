function [x, time] = bit_sh3(x)
% Funkcja tasuje zamieniaj¹c bity indesków
tic
n=length(x);
tmp = 0;
for i=1:n/2
    ind=bitswap(i-1,n);
    tmp = x(i); x(i) = x(ind+1); x(ind+1)=tmp;
end

time = toc;
end
