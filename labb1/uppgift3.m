clc
clear

% part b
% The function to derive.
% f = @(x) 60*x - ((x.^2 + x + 0.1).^6)/((x+1).^6) - 10.*x.*exp(-x);
% h = 0.00001; % epsilon
% x = [0.2,1]; % Point(s) where the function are to be derived.
% forward = derive(f, x, h, 1); % Derive using forward approximation.
% center = derive(f, x, h, 2); % Derive using center approximation (forward, back).
% 
% disp('Forward approximation');
% disp(forward);
% disp('Center approximation');
% disp(center);

% % part c
% 
% f = flg2();
% h = 10^(-6);
% 
% x = [0.2,1];
% forward = derive(f, x, h, 1); % Derive using forward approximation.
% center = derive(f, x, h, 2); % Derive using center approximation (forward, back).
% 
% disp('Forward approximation');
% disp(forward);
% disp('Center approximation');
% disp(center);

% part d

f = flg2();
f_ = @(x) 60-(6.*(x+(1./(10.*(x+1)))).^5 .* (1 - 1./(10.*(x+1).^2))) - 10.*exp(-x).*(1-x);
x = [0.2,1];
forward = [];
forwarderr = [];
center = [];
centererr = [];
tests = [1.E-3 1.E-4 1.E-5 1.E-6 1.E-7 1.E-8 1.E-9 1.E-10 1.E-11 1.E-12 1.E-13];
for h= tests
    fw = derive(f,x,h,1);
    err = abs(f_(x) - fw);
    forward = [forward; fw];
    forwarderr = [forwarderr; err];
    
    fc = derive(f,x,h,2);
    err = abs(f_(x) - fc);
    center = [center;fc];
    centererr = [centererr; err];
end
size(tests)
disp('Values');
disp(f(x));
disp('Forward approximation');
disp(forward);
disp('Center approximation');
disp(center);

loglog(tests,forwarderr, 'red', tests, centererr, 'blue')