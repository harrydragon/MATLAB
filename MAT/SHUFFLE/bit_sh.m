function [vect, time] = bit_sh(x)
% Funkcja tasuje zamieniaj¹c bity indesków
tic
n=length(x);
vect=zeros(1,n);

for i=1:n
    ind=bitswap(i-1,n);
    vect(i)=x(ind+1);
end

time = toc;
end
