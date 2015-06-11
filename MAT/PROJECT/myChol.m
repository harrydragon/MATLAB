function [ L ] = myChol( A )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[n,m]=size(A);
L=zeros(n,n);

for k=1:n
    lks=0;
    for q=1:k-1
        lks=lks + L(k,q)*L(k,q);
    end
    L(k,k)=sqrt(A(k,k)-lks);
    lks=0;
    for i=k+1:n
        for s=1:k-1
            lks=lks+L(i,s)*L(k,s);
        end
        L(i,k)=(A(i,k)-lks)/L(k,k);
    end

end
end

