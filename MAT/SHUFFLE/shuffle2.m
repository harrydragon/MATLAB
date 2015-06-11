function [ vect ] = shuffle2( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% jakieœ z internetu, sortuje pierw parzyste, potem nieparzyste
tic
n=length(x);
vect=zeros(1,n); % help vector
 for i=1:n/2 
     vect(i)=x(2*i-1);
 end
 for j = n/2+1:n
     vect(j)=x(2*j-n);
 end
toc
end

