function [ss,us] = utokad(q)
   f = @(s,u) [sqrt(1-u(3)^2);u(3);-q*u(2)*sqrt(1-u(3)^2)];
   % s ∈ [0, 0.5]
   range = [0,0.5];
   % ẏ = dy/dx*dx/ds, dy/dx(0) = 0 => ẏ(0) = 0
   % x(s) = integral{0,0.5}(sqrt(1-ẏ))ds, ẏ(0) = 0 => x(0) = integral{0,0.5}(1)ds = 0.5
   % y(s) = integral{0,0.5}(sqrt(1-ẋ))ds, ẋ(0) = 0 => y(0) = integral{0,0.5}(1)ds = 0.5
   % start = [x(0), y(0), ẏ(0)]
   start = [0, 0.3, 0];
   [ss,us] = ode45(f, range, start);
end

