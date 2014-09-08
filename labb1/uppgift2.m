clc
clear

% Part a
% 
% days = [91,121,152,182,213,244];
% temps = [13.2,15.8,18.0,18.4,16.6,14.1];
% p = polyfit(days,temps,2);
% x = 80:1:265;
% values = polyval(p,x);
% plot(x,values)
% set(gca,'XTick', days)
% set(gca,'XTickLabel',{'1 apr', '1 maj', '1 jun', '1 jul', '1 aug', '1 sep'})

% Part b

days = [1,32,60,91,121,152,182,213,244,274,305,335];
sun = [6.1,8.0,10.4,13.2,15.8,18.0,18.4,16.6,14.1,11.4,8.7,6.6];
p = polyfit(days,sun,2);
x = 80:1:265;
values = polyval(p,x);
plot(days,sun,'*')
hold all
set(gca,'XTick', days)
set(gca,'XTickLabel',{'1 jan', '1 feb', '1 mar', '1 apr', '1 maj', '1 jun', '1 jul', '1 aug', '1 sep', '1 okt', '1 nov', '1 dec'})
w = 2*pi/365;
d = @(t) [1, cos(w.*t), sin(w.*t)];
A = [];
for t = days
   A = [A; d(t)];
end
B = sun';
% Ax = B
c = A\B;
r = A*c - B;
errorSq = r'*r;
F = @(t) c(1) + c(2) * cos(w*t) + c(3) * sin(w*t);
alldays = 1:1:365;
plot(alldays,F(alldays))

june6_ = 157;
june6 = F(june6_);
disp('Nationaldagens timmar');
disp(june6);
disp('Residual');
disp(r);
disp('Fel i kvadrat');
disp(errorSq);

% Part c
% days = [1,32,60,91,121,152,182,213,244,274,305,335];
% sun = [6.1,8.0,10.4,13.2,15.8,18.0,18.4,16.6,14.1,11.4,8.7,6.6];
% 
% w = 2*pi/365;
% k = 6; % Magic number, it works!
% d = @(t) [1, cos(w*t), sin(w*t),cos(k*w*t),sin(k*w*t)];
% A = [];
% for t = days
%    A = [A; d(t)];
% end
% B = sun';
% c = A\B;
% r = A*c - B;
% F = @(t) c(1) + c(2) * cos(w*t) + c(3) * sin(w*t) + c(4) * cos(k*w*t) + c(5) * sin(k*w*t);
% errorSq = r'*r;
% june6_ = 157;
% june6 = F(june6_);
disp('Nationaldagens timmar');
disp(june6);
disp('Residual');
disp(r);
disp('Fel i kvadrat');
disp(errorSq);
