ht=[]; st=[];
for N=[49 99 199 399 799]

%Indatadel
a=1; b=4;alfa=1; beta=-1;
p=inline('2*sqrt(x)','x');


%Förberedelser--definiera diskretiseringsnätet
h=(b-a)/(N+1); 
xinre=[a+(1:N)*h];         %de inre diskretiseringspunkterna genereras
                           %    indiceras 1,2,  ... N i vektorn xinre
x=[a, xinre, b];	   %alla punkterna lagras i vektorn x
                           %  de inre punkterna har index 2,3,--- N+1
                           %  i vektorn x

			   
A=sparse(N);               %Anger att N x N matrisen A skall lagras
                           %    som en gles matris
b=zeros(N,1);

%Generera matrisen och högerledet
for i=1:N
  A(i,i)=-2/h^2+xinre(i);
  if i>1, A(i,i-1)=1/h^2-p(xinre(i))/(2*h); end
  if i<N, A(i,i+1)=1/h^2+p(xinre(i))/(2*h); end 
  b(i)=6*xinre(i);
end  
b(1)=b(1)-(1/h^2-p(xinre(1))/(2*h))*alfa;
b(N)=b(N)-(1/h^2+p(xinre(N))/(2*h))*beta;
			   
%Lös ekvationssystemet och presentera lösningen			 
yinre=A\b;
y=[alfa; yinre; beta]';
 mitt=(N+1)/2+1;
ht=[ht; h]; st=[st; y(mitt) ];
end
format short e
[ht st-st(end)]



