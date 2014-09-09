% This function will calculate the derivative of the function f.

function [derivative] = derive( f, x, epsilon, precision)
    forward = @(a) (f(a + epsilon) - f(a))/epsilon;
    center = @(a) (f(a + epsilon) - f(a - epsilon))/(2*epsilon);
    
    if precision == 1 %forward derivative.
        derivative = arrayfun(forward, x);
    else %center derivative.q
        derivative = arrayfun(center, x);
    end
end

