% Initialize
clear,clc,close all
format LONG

% Assignment 2a

% Date 16/9-14
tolLow=odeset('RelTol',1E-6);
tolHigh=odeset('RelTol',1E-3);
% % y(2) means y' and y(1) means y
% dydt = @(x,y) [y(2);y(1)/9-pi*y(1)*exp(x^(3)/3)*(2*y(2)*sin(pi*x)+pi*y(1)*cos(pi*x))];
% 
% [x,y] = ode45(dydt,[2,2.6],[1,-1/3],mopt);
% disp('value at x=2.6');
% disp(y(end));
% 
% plot(x,y(:,1))
% xlabel('x')
% ylabel('y(x)')
% title('Solution to differential equation A')

% Assignment 2b

% Date 23/9-14

% y(2) means y' and y(1) means y, y(3) means y''

dydt = @(x,y) [y(2);y(1)/9-pi*y(1)*exp(x^(3)/3)*(2*y(2)*sin(pi*x)+pi*y(1)*cos(pi*x));pi*y(1)^2];

[x,y] = ode45(dydt,[2,2.6],[1,-1/3,0],tolLow);
disp('low tolerance')
disp('y(2.6)');
disp(y(end));
disp('u3')
disp(pi*y(end)^2)

[t,j] = ode45(dydt,[2,2.6],[1,-1/3,0],tolHigh);

disp('High tolerance')
disp('y(2.6)');
disp(j(end));
disp('u3')
disp(pi*j(end)^2)

figure(1)
subplot(2,1,1)
plot(x,y(:,1))
xlabel('x')
ylabel('y(x)')
title('Solution to differential equation B Low Tolerance')

subplot(2,1,2)
plot(t,j(:,1))
xlabel('x')
ylabel('y(x)')
title('Solution to differential equation B High Tolerance')