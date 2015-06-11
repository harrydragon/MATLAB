function [bjork_time, sec_time, bit_3_time] = main(p)
clc;
bjork_time=[1:p];
sec_time=[1:p];
% bit_time=[1:p];
% bit_2_time=[1:p];
bit_3_time=[1:p];

for i=5:p+5;
     y=0:(2^i)-1;
     m=length(y);
     bjork=zeros(1,m);
  %  disp('Czas dla bjork');
    [bjork,bjork_time(i-4)]=bjork_sh(y);
%     bitsh=zeros(1,m);
%    % disp('Czas dla bit_sh');
%     [bitsh, bit_time(i-4)]=bit_sh(y);
%     bitsh2=zeros(1,m);
%   %  disp('Czas dla bit_sh2');
%     [bitsh2,bit_2_time(i-4)]=bit_sh2(y);
    bitsh3=zeros(1,m);
    [bitsh3,bit_3_time(i-4)]=bit_sh3(y);
    secv=zeros(1,m);
%    disp('Czas dla sec_v_sh');
    [secv,sec_time(i-4)]=sec_vect_sh(y);    

end

op=5:1:p+5;
bar(op, bjork_time);xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
title('Bjork shuffle');
figure;
% bar(op,bit_time);xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
% title('Bit shuffle 1');
% figure;
% bar(op, bit_2_time);xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
% title('Bit shuffle 2');
% figure;
bar(op, bit_3_time);xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
title('Bit shuffle');
figure;
bar(op,sec_time);xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
title('Second vector shuffle');
figure;
% plot(op, bjork_time,'r', op, bit_time,'g', op,bit_2_time, 'b',op,bit_3_time,'y', op, sec_time,'k');xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
% title('Porownanie');
% legend('Bjork shuffle','Bit shuffle 1','Bit shuffle 2','Bit Shuffle 3','Second vector shuffle','Location','Northwest');
plot(op, bjork_time,'-',op,bit_3_time,'-.', op, sec_time,':');xlabel('Dlugosc wektora 2^x'); ylabel('Czas obliczen [s]');
title('Porownanie');
legend('Bjork shuffle','Bit Shuffle ','Second vector shuffle','Location','Northwest');


