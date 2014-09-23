% Initialize
clear,clc,close all
format LONG

y = @(x) (exp(-x./3)./(2-cos(pi.*x)));
y_squared = @(x) y(x).^2;
volume = @(x) pi * integrate_(0,2.6,y_squared,x);

%TODO What does it mean with the simpson value?

disp('[Length == 0.1]');
disp(volume(0.1));

disp('[Length == 0.05]');
disp(volume(0.05));

disp('[Using quad]')
temp = pi * integral(y_squared,0,2.6);
disp(temp);


%TODO print out the 3d image.
x = 0:(2*pi)/30:2*pi;