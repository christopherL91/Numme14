% Initialize
clear,clc,close all
format LONG

% Assignment 2a

% Date 16/9-14
mopt=odeset('RelTol',1E-6);
% y(2) means y' and y(1) means y
dydt = @(x,y) [y(2);y(1)/9-pi*y(1)*exp(x^(3)/3)*(2*y(2)*sin(pi*x)+pi*y(1)*cos(pi*x))];

[x,y] = ode45(dydt,[2,2.6],[1,-1/3],mopt);
disp('value at x=2.6');
disp(y(end));

plot(x,y(:,1))
xlabel('x')
ylabel('y(x)')
title('Solution to differential equation')

% Assignment 2b

% Date 23/9-14

% y(2) means y' and y(1) means y, y(3) means y''

% dydt = @(x,y) [y(2);y(1)/9-pi*y(1)*exp(x^(3)/3)*(2*y(2)*sin(pi*x)+pi*y(1)*cos(pi*x));pi*y(1)^2];
% 
% [x,y] = ode45(dydt,[2,2.6],[1,-1/3,0],mopt);
% disp('value at x=2.6');
% disp(y(end));
% 
% plot(x,y(:,1))
% xlabel('x')
% ylabel('y(x)')
% title('Solution to differential equation')