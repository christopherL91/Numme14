%Newton rapsons method.
% x initial guess
% function handler to the derivative.
% tolerance is tolerance in which the numbers are considered the same.
% debug flag if should print debug messages.

function result = raphsonJacobian(X,J_F,F,tolerance)
    B = -F(X);
    J = J_F(X);
    h = J\B;
    X = X+h';
    while norm(h) > tolerance
        B = -F(X);
        J = J_F(X);
        h = J\B;
        X = X+h';        
    end
    
    result = X;
end


