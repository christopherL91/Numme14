function [s,xs,ys,te,ye] = ursprunglig( q )
    % Stop when finding a value that crosses the x axis in negative direction
    options = odeset('Events',@findroot);
    u = [0.3 0];
    f = @(t,u) [u(2);-q*u(1)*(1+u(2)^2)^(3/2)];
    [xs, ys, te, ye] = ode45(f, [0 1], u, options);
    s = bage(xs,ys(:,1));
end

