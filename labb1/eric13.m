f=inline('exp(x)','x');
h=1; a=1;  ea=exp(a);
format long, format compact
for i=1:15
  fp =(f(a+h)-f(a))/h;
  disp([h fp fp-ea])
  h=h/10;
end
