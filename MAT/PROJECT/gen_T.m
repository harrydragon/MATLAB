function [ T ] = gen_T( n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Wyznaczanie macierzy trójprzek¹tniowej DD nxn

T=2*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);

end

