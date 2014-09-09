%Newton rapsons method.
% x initial guess
% function handler to the derivative.
% tolerance is tolerance in which the numbers are considered the same.
% debug flag if should print debug messages.

function result = newraphson(x,d,tolerance,debug)
    if nargin < 4
      debug = false;
    end
    if debug
       fprintf('start guess x: %d\n',x);
    end
    
    x = x - d(x);
    while abs(d(x)) > tolerance
       x = x - d(x);
       if debug
           fprintf('iteration x: %d f(x)/f''(x): %d\n',x, d(x));
       end
    end
    result = x;
end

