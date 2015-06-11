function [blm] =zad2( )
x=(-1:0.01:1);
y=x.^3+2*x.^2+5*x;

for i=1:5
    a=polyfit(x,y,i);
    p=polyval(a,x);
    
    bl=y-p;
    blm(i)=max(abs(bl));
    
    figure
    subplot(2,1,1)
    plot(x,y,x,p);
    subplot(2,1,2)
    plot(x,bl)
end
end