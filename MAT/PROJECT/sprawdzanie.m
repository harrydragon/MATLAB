
f=1:8;
n=length(f);
m=n/2;
E=zeros(m-1,m-1); % macierz wymiany
for i=1:m-1
    E(i,m-i)=1;
end

