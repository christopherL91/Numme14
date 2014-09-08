
%Newton-Raphssons metod f�r ekvationen  x^2-4cos(x)=0
%Startv�rdet x m�ste anges innan m-filen exekveras
format short e
disp('       x          f(x)         fp(x)      h=f(x)/fp(x)')
format compact
h=1;           
while abs(h) > 1.0e-10*abs(x),
  f =x^2-4*cos(x);
  fp=2*x+4*sin(x);
  h =f/fp;
  disp([x f fp h])
  x=x-h;
end
format long
x

