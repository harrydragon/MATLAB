function [x, time]=bjork_sh(x)
% Bjork, algorytm z wyk³adu nie wykorzystuj¹cy dodatkowej tablicy
tic;
n=length(x);
nv2=n/2;
nm1=n-1;
j=1;
for i=1:nm1
    if(i<j)
        tmp=x(i);x(i)=x(j);x(j)=tmp; %swap
    end
    k=nv2;
    while(k<j)
        j=j-k;k=k/2;
    end
    j=j+k;
end
time = toc;
end
