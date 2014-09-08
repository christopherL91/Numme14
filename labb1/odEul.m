function [tout, yout]= odEul(FunFcn , t0, tfinal, y0, Nstp);
h = (tfinal - t0)/Nstp;        %steglängden beräknas
t = t0;
y = y0(:);                     %y blir en kolumnvektor
tout = t; 
yout = y.';                    %yout blir en radvektor med
                               % samma komponenter som y
                               % .' transponerar utan att komplex-
                               % konjugera(viktigt om y är komplex)        
for i = 1:Nstp,
   s1   = feval(FunFcn,t,y);   %motsvarar s1=FunFun(t,y);
   y    = y + h*s1;            %FunFun måste leverera en kolumnvektor;     
   t    = t + h;
   tout = [tout; t];           %lägg till ett värde i tout
   yout = [yout; y.'];         %lägg till en rad i yout
end;
