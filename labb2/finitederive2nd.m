function [ y, i ] = finitederive2nd( f, i, h )
    f
    y = (f(i+1) - 2*f(i) + f(i-1))/(h^2);
end

