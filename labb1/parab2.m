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
    A(i-1,i-1)=1+2*kh2; 
    if i>2, A(i-1,i-2)=-kh2; end
    if i<N-1, A(i-1,i)=-kh2; end
  end
  u(j+1,2:N-1)=A\u(j,2:N-1)';
end

surfc(X,T,u)

