% Initialize
clear,clc,close all
format LONG

y = @(x) (exp(-x./3)./(2-cos(pi.*x)));
y_squared = @(x) y(x).^2;
volume = @(h) pi * integrate_(0,2.6,y_squared,h);

disp('[Length == 0.1]');
disp(volume(0.1));

disp('[Length == 0.05]');
disp(volume(0.05));

disp('[Using quad]')
temp = pi * integral(y_squared,0,2.6);
disp(temp);

x = linspace(0,2.6)';
f = y(x);
figure(1);
plot(x,f);

phi = linspace(0,2*pi,30);
X = x*ones(size(phi));
Y = f*cos(phi);
Z = f*sin(phi);
figure(2);
surfl(X,Y,Z);