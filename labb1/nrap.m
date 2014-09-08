
%Newton-Raphssons metod för ekvationen  x^2-4cos(x)=0
%Startvärdet x måste anges innan m-filen exekveras
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

