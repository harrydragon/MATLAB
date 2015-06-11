% Generate the figures for Cleve's Corner.
% "Magic" Reconstruction: Compressed Sensing.
% MathWorks News and Notes, Fall, 2010.
% Use "L1 magic" by Justin Romberg.
% http://www.acm.caltech.edu/l1magic 

% f = signal = tone from "1" key on touch tone phone.
% b = random subsample.

Fs = 40000;
t = (1:Fs/8)'/Fs;
f = (sin(2*pi*697*t) + sin(2*pi*1633*t))/2;
n = length(f);
m = ceil(n/10);
k = randperm(n)';
k = sort(k(1:m));
b = f(k);

% Plot f and b.
% Plot idct(f) = inverse discrete cosine transform.

axf = [0 max(t)/4 -1.2 1.2];
axd = [0 n/8 -10 10];
figure(1);
subplot(2,1,1)
plot(t,f,'b-',t(k),b,'k.')
axis(axf);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('f = signal, b = random sample')
subplot(2,1,2)
plot(idct(f))
axis(axd);
set(gca,'xtick',0:100:600)
title('c = idct(f)')
drawnow

% A = rows of DCT matrix with indices of random sample.

A = zeros(m,n);
for i = 1:m
   ek = zeros(1,n);
   ek(k(i)) = 1;
   A(i,:) = idct(ek);
end

% y = l_2 solution to A*y = b.

y = pinv(A)*b;

% x = l_1 solution to A*x = b.
% Use "L1 magic".

x = l1eq_pd(y,A,A',b,5e-3,32);

% Plot x and dct(x).
% Good comparison with f.

figure(2)
subplot(2,1,1)
plot(x)
axis(axd);
set(gca,'xtick',0:100:600)
title('x = {\it l}_1 solution, A*x = b ')
subplot(2,1,2)
plot(t,dct(x))
axis(axf);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('dct(x)')

% Plot y and dct(y).
% Lousy comparison with f.

figure(3)
subplot(2,1,1)
plot(y)
axis(axd);
set(gca,'xtick',0:100:600)
title('y = {\it l}_2 solution, A*y = b ')
subplot(2,1,2)
plot(t,dct(y))
axis(axf);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('dct(y)')

% Play three sounds.

sound(f,Fs)
pause(1)
sound(dct(x),Fs);
pause(1)
sound(dct(y),Fs)
