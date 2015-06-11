% CS example 1
 % Sens ing mat r i x p h i i s random .
 % Re p r e s e n t a t i o n b a s i s Ps i i s t h e c a n o n i c a l b a s i s .
 % Re cov e r ing u s ing l 1 magic .

 clc
 clear all
 close all

 n = 512; % S i g n a l l e n g t h
 s = 25 ; % S p a r s i t y l e v e l
 m = 5 * s ; % Number o f measurements

 t =[0:n-1]';
 f = cos(2*pi /256*t) + sin(2*pi/128*t) ;
 %f = sin(2*pi /256*t) + sin(2*pi/128*t) ;
 A = get_A_random(n ,m);
 %A = get_A_fourier(n ,m);

 y = A * f ; % Take t h e measurements

 % S o l v e u s ing CVX.
 Psi=inv(fft(eye(n)));
 cvx_begin
 variable xp(n) complex;
 minimize (norm(xp,1)) ;
 subject to
 A*Psi*xp == y ;
 cvx_end

 norm(f-xp)/norm(f);
 %subplot(2,1,1);
 plot ( f )
 hold on
 %subplot(2,1,2);
 plot ( xp ,'r.' )
 legend ( ' Original ' , ' Recovered ' )