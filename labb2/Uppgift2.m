% Initialize
clear,clc,close all
format LONG

% Assignment 2
% Date 16/9-14
mopt=odeset('RelTol',1E-6);
%There have to be a bug here... See warning message.
% y(2) means y' and y(1) means y
dydt = @(x,y) [y(2);y(1)/9-pi*y(1)*exp(x^(3)/3)*(2*y(2)*sin(pi*x)+pi*y(1)*cos(pi*x))];

[x,y] = ode45(dydt,[2,2.6],[1,-1/3],mopt);
disp('value at x=2.6');
disp(y(end));

plot(x,y)