clc;
clf;
format long;
axis equal;
%Sekantmetoden för färdiguträknade funktionsvärden
secant = @(f,x) [x(2); x(2) - f(2)*((x(2) - x(1))/(f(2) - f(1)))];
hold on;

tolerance = 1E-12;
% Erhåll ett a för det förenklade systemet
a = [0.45, 0.4];
s = 0.6;
u = @(s) s-0.5; %Båglängd - 0.5
f = [u(forenklad(a(1))), u(forenklad(a(2)))];
ds = 0.1;
%Använd sekantmetoden för att hitta en startgissning för a och q
while abs(u(s)) > tolerance
    a = secant(f,a);
    [s,xs,ys] = forenklad(a(2));
    f = [f(2), u(s)];
end
%Lös q för a
q = pi^2/(4*a(2)^2);

%Använd detta som startgissnign för att lösa ursprungliga systemet
s = ursprunglig(q);

%Skapa en annan punkt i närheten av det första q 
%för att kunna använda sekantmetoden
h = 1E-3;
s1 = ursprunglig(q+h);

qs = [q, q+h];
ss = [s, s1];
us = u(ss);

%Använd sekantmetoden för att hitta det q som ger båglängd 0.5
while abs(u(s)) > tolerance
    qs = secant(us,qs);
    [s,xs,ys] = ursprunglig(qs(2));
    us = [us(2), u(s)];
end
q = qs(2);
result = bage(xs,ys(:,1))
plot([0, xs(end)],[0.3, ys(end,1)], 'black');
plot([-xs(end), xs(end)], [0,0],'yellow');
plot(xs,ys(:,1));
plot(-xs,ys(:,1));

%M = -q.*ys(:,1);
%S = M./-ys(:,1)
S = q;
disp('q = S =');
disp(S);

[ss,us]=utokad(q);
plot(us(:,1),us(:,2),'red')
plot(-us(:,1),us(:,2),'red')
qs = [10,15];
[~,us0] = utokad(qs(1));
y0 = us0(end,2); %get the last y value
[~,us1] = utokad(qs(2));
y1 = us1(end,2); %get the last y value
ys = [y0,y1];
while abs(ys(2)) > tolerance
   qs = secant(ys,qs);
   [~,us] = utokad(qs(2));
   y = us(end,2); %get the last y value
   ys = [ys(2),y];
end
plot(us(:,1),us(:,2),'green')
plot(-us(:,1),us(:,2),'green')
q = qs(2)
shg;