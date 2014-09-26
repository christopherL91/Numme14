function [y,i] = finitederive1st( f,i,h )
    y = (f(i+1) - f(i-1))/(2*h);
end

