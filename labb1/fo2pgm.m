clf,hold off
format short e, format compact
a=0; b=2; yL=1; yR=8;
N=19; Ns=5;
h=(b-a)/(N+1); h2=h^2; x=[a+h:h:b-h]';
A=sparse(N,N); %lagrar A glest;ger snabbare lösare A\F
F=zeros(N,1);
for i=1:N,
   A(i,i)=-2/h2-2*x(i);
   if i<N, A(i,i+1)=1/h2; end
   if i>1, A(i,i-1)=1/h2; end
   F(i)=(1-2*x(i))*exp(x(i));
end
F(1)=F(1)-yL/h2; F(N)=F(N)-yR/h2;
y=A\F;
xp=[a;x;b]; yp=[yL;y;yR];
plot(xp,yp);

xt=xp(1:Ns:N+2); yt=yp(1:Ns:N+2);
[xt yt]
