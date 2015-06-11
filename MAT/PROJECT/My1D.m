clear; clc;
a = 0;b = 10;c = 0;d = 10;%konce przedzialow
%poniewa¿ mx bêdzie równe my
%to mo¿emy korzystaæ tylko z 1 macierzy T
%hx=hy=h;
mx = 5;% liczba podprzedzia³ów w x
my = 5;% liczba podprzedzia³ów w y
nx = 4;%mx-1;% pkty siatki do obliczenia w x
ny = 4;%my-2;% pkty siatki do obliczenia w y
hx=(b-a)/mx; hy=(d-c)/my;%odstêp 
Tnx = gen_T(nx);
Tny = gen_T(ny);
Dx = eig(Tnx);%wartoœci w³asne macierzy T
Dy = eig(Tny);
u=1:nx*ny;
u=u-u;
U=reshape(u,nx,ny);
A=gen_A(mx,my);
x=a+hx:hx:b-hx;
y=c+hy:hy:b-hy;
f=x.^2-y.^2;
%warunki poczatkowe
ux0=x.^2; ux1 = x.^2 -1;
u0y=-y.^2; u1y = 1- y.^2;
% [X Y]=meshgrid(x,y);
% f=sin(2*X.*Y)*sin(Y);
% mesh(X,Y,f);





