clc
clear

phi = 0:0.01:pi/2;

x = @(a) cos(a).^3;
y = @(a) 1.5.*sin(a)-sin(a).^3;

tolerance = 1E-6;
y_ = @(a) 1.5*cos(a)-3*((sin(a))^2)*(cos(a));
d = @(a) (y(a)-0.64)/(y_(a)); %derivative.

a = 0.0; % start value guess.
a = newraphson(a,d,tolerance);
guess1X = x(a);
guess1Y = y(a);
a = 1.0; % guess two
a = newraphson(a,d,tolerance);
guess2X = x(a);
guess2Y = y(a);

plot(x(phi),y(phi), [guess1X,guess2X],[guess1Y,guess2Y],'*')
xlabel('x = cos^3 a')
ylabel('y = 1.5sin a - sin^3 a')