function [ y, x ] = finitediffmap( f, N, startpoint, endpoint )
L = endpoint(1)-startpoint(1);
h = L/(N+1);
x = startpoint(1)+h:h:endpoint(1)-h;
y = f(x,h);
end

