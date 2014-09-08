function result = newraphson( x, d, tolerance )
    x = x - d(x);
    while abs(d(x)) > tolerance
       x = x - d(x);
    end
    result = x;
end

