%Newton-Raphssons metod f|r ekvationssystem
%filnamn: snewton.m Kompletterande exempel 16  
format short e, format compact
disp('       x          f(x)              h=J\f(x)');
x=[0.1 0.2 0.5]';    %Startvektor
h=x;
iter=1;
while ( (norm(h,inf) > 1.0e-10*norm(x,inf)) & (iter < 20)),
  f =[10*x(1)-x(2)-x(1)^3
      x(1)+10*x(2)-x(3)+x(2)^3-2
      x(1)+2*x(3)+x(3)^3-1];
  %Jacobian
  J=[10-3*x(1)^2   -1    0
       1   10+3*x(2)^2  -1
       1            0   2+3*x(3)^2]; 
  h =-J\f;
  disp(iter)
  disp([x f h])
  x=x+h; iter=iter+1;
end
format long
x


