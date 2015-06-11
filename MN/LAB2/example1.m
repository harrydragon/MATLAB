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

 f = get_sparse_fun(n,s);
 A = get_A_random(n ,m);

 y=A*f ; % Take t h e measurements

 % S o l v e u s ing l 1 magic .
 path(path , ' C:\Users\Harry\Documents\MATLAB\MN\LAB2\compressed-sensing-tutorial\l1magic\Optimization');
 x0 = pinv(A)*y ; % i n i t i a l g u e s s = min ene r g y
 tic
 xp = l1eq_pd(x0, A, [], y, 1e-3);
 toc

 norm( f - xp ) / norm( f );
 %subplot(2,1,1);
 plot ( f )
 hold on
 %subplot(2,1,2);
 plot ( xp ,'r.' )
 legend ( ' Original ' , ' Recovered ' )