function [ value ] = stepintegrate( f, xmin, xmax, steps )
h = (xmax-xmin)/steps;
sum = 0;
for i = steps
    x = xmin + h*(i-1);
    xnext = xmin + h*(i);
    sum = sum + (f(x) + f(xnext))/2;
end
value = h * sum;

end

