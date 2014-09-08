clf, clear
%h=0.1; k=0.004;
h=0.1; k=0.04;

x=0:h:1; t=0:k:0.6;
N=length(x); M=length(t);
kh2=k/h^2;
[X,T]=meshgrid(x,t);

u(1,:)=sin(pi*x);

for j=1:M-1
  j1=j+1;
  u(j1,1)=0; u(j1,N)=0;
  for i=2:N-1
    u(j1,i)=u(j,i)+kh2*(u(j,i-1)-2*u(j,i)+u(j,i+1));
  end
end

surfc(X,T,u)

