function [tout, yout]= odEul(FunFcn , t0, tfinal, y0, Nstp);
h = (tfinal - t0)/Nstp;        %stegl�ngden ber�knas
t = t0;
y = y0(:);                     %y blir en kolumnvektor
tout = t; 
yout = y.';                    %yout blir en radvektor med
                               % samma komponenter som y
                               % .' transponerar utan att komplex-
                               % konjugera(viktigt om y �r komplex)        
for i = 1:Nstp,
   s1   = feval(FunFcn,t,y);   %motsvarar s1=FunFun(t,y);
   y    = y + h*s1;            %FunFun m�ste leverera en kolumnvektor;     
   t    = t + h;
   tout = [tout; t];           %l�gg till ett v�rde i tout
   yout = [yout; y.'];         %l�gg till en rad i yout
end;
