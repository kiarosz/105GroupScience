%PLOT O GRÁFICO DE QUALQUER EQUAÇÃO DIFERENCIAL ORDINÁRIA (EDO).
% NESSE CASO ESTAMOS PLOTANDO A EDO DA SEÇÃO 4.1 MATÉRIA COMUM.  

clc;close all; clear all;

a = 0;
b=8.0;
h=0.001;
yinicial=0.01;

[x,y]=metodoRK4(@EDOFxy,a,b,h,yinicial); %SUBSEÇÃO 4.1 MATÉRIA COMUM. 
%[x,y]=metodoRK4RK4(@EDOFxy1,a,b,h,yinicial);
%[x,y]=meta.classodoRK4(@EDOFxy2,a,b,h,yinicial);
%[x,y]=metodoRK4(@EDOFxy3,a,b,h,yinicial);
%[x,y]=metodoRK4(@EDOFxy4,a,b,h,yinicial); SEÇÃO 6 Combinando as três componentes. 

figure
plot(x,y,'r', 'linewidth',3)
%plot(x,y,'r',x,y_check,'-k','linewidth',2)
axis([0 8 0 5]);
%axis([0 10 0 10]);
title('Método de Runge-Kutta')
%legend('Runge_Kutta', 'ode45')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%print -deps fig_7
%save runge1.txt x y -ascii
%save('runge1');
%save('runge1_RBF.dat','x','-ascii','y','-ascii');