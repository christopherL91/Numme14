function [s,xs,ys] = forenklad(a)
   q_sqrt = pi/(2*a);
   q=q_sqrt^2;
   % a = pi/(2*q_sqrt);
   y = @(x) 0.3*cos(x*q_sqrt);
   y_ = @(x) -0.3*q_sqrt*sin(x*q_sqrt);
   f = @(t,u) [y_(t);-q*y(t)];
   u = [0.3 0];
   [xs, ys] = ode45(f, [0 a], u);
   s = bage(xs,ys(:,1));
end

