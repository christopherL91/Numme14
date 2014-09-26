% Initialize
clear,clc,close all
format LONG

f = @(u,h) @(i) finitederive2nd(u,i,h) - i.^2.*u.*(u-1);
[y,x] = finitediffmap(f, 5, [1,2], [3,4]);

colsize = size(x');
for i = 2:colsize(1)-2
    disp(i);
    val = x(1,i);
    s = y(val);
    minjac(y,i)
end


