function [blm] =zad1( )

x=(-1:0.1:1);
y=sin(x*pi);
z=[2,3,5,9];

for i=1:4
    x1=linspace(-1,1,z(i));
    y1=sin(x1*pi);
    yi1=interp1(x1,y1,x,'spline');
    bl=y-yi1;
    blm(i)=max(abs(bl));
    figure
    subplot(2,1,1)
    plot(x,y,x1,y1,'*',x,yi1)
    title('Wykres danej funkcji i jej przyblizenia')
    subplot(2,1,2)
    plot(x,bl)
    title('Wykres bledu')
end

end