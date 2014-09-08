function [tout, yout]= odRK(FunFcn , t0, tfinal, y0, Nstp);
h = (tfinal - t0)/Nstp;       
t = t0;
y = y0(:); 
tout = t; 
yout = y';

for i = 1:Nstp,
   k1   = h*feval(FunFcn,t,y);             %motsvarar k1=FunFun(t,y);
   k2   = h*feval(FunFcn,t+h/2,y+k1/2);  
   k3   = h*feval(FunFcn,t+h/2,y+k2/2);  
   k4   = h*feval(FunFcn,t+h,y+k3);  
   y    = y + (k1+2*k2+2*k3+k4)/6; 
   t    = t + h;
   tout = [tout; t];        
   yout = [yout; y'];     
end;
