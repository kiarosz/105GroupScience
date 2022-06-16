%MÉTODO DE RUNGE-KUTTA DE QUARTA ORDEM, QUE PODE SER UTILIZADO
% EM QUALQUER EQUAÇÃO DIFERENCIAL ORDINÁRIA (EDO).

function [x,y] = metodoRK4(EDO, a,b,h,yinicial)
  x(1) = a; y(1) = yinicial;
  n = (b-a)/h
  
  for i = 1:n
    x(i+1) = x(i) + h;
    k1 = EDO(x(i),y(i)); 
    xh1 = x(i) + k1*h/2;
    yk1 = y(i) +k1*h/2;
    
    k2 = EDO(xh1, yk1);
    yk2 = y(i) +k2*h/2;
    
    k3 = EDO(xh1, yk2);
    yk3 = y(i) +k3*h/2;

    k4 = EDO(x(i+1), yk3);
    y(i+1) = y(i) +(k1+ 2*k2 +2*k3 + k4)*h/6;
    
  end
  
end
