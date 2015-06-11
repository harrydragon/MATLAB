function [blmax]=cw2();

x=[-1:0.001:1];
y=(x.^6 - 13*x.^5 + 0.75*x.^4 - 12.13*x.^2 + 5)./(x.^-12);

%f=polyfit(x,y,r) x,y wektory danych, r stopieñ wielopmianu
%polyval

for i=1:5:30
   a=polyfit(x,y,i);   
   b=polyval(a,x);   
   bl=y-b;
   blmax(i)=max(abs(bl));   
   figure; 
   subplot(2,1,1);
   plot(x,y,x,b);
   title('aproksymacja funkcji jednej zmiennej');
   xlabel('zmienna niezale¿na');
   ylabel('wartosc wielomianu');
   
   subplot(2,1,2);
   plot(x,bl);
   title('wykres bledu aproksymacji');
    
    
end

end