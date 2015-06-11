function [ A ] = gen_A( m1, m2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   Generowanie macierzy A dla równañ poissona dwu-wymiarowych, nxn, DD,
n1=m1-1;
n2=m2-1;
Tn1=gen_T(n1);
Tn2=gen_T(n2);
A=kron(eye(n2),Tn1)+kron(Tn2,eye(n1));

end

