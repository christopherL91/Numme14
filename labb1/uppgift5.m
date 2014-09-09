clc
clear


f = flg2();
f_ = @(x) 60-(6.*(x+(1./(10.*(x+1)))).^5 .* (1 - 1./(10.*(x+1).^2))) - 10.*exp(-x).*(1-x);

d = @(x) f(x)/f_(x);

tolerance = 1E-6;
f__ = @(x) derive(f_,x,tolerance,2);

guess1 = 0.1;
root1 = newraphson(guess1, d, tolerance, true);
fprintf('Root 1: %d\n\n', root1);
guess2 = 2.0;
root2 = newraphson(guess2, d, tolerance, true);
fprintf('Root 2: %d\n\n', root2);

err = @(x) f__(x)/(2*f_(x));
constants = [err(root1),err(root2)];

disp('Constants');
disp(constants);

fprintf('%d: |x-x*| <= %d/%d <= %d\n\n',root1, abs(f_(root1)),ceil(abs(f_(root1))),abs(f_(root1))/ceil(abs(f_(root1))));
fprintf('%d: |x-x*| <= %d/%d <= %d\n\n',root2, abs(f_(root2)),ceil(abs(f_(root2))),abs(f_(root2))/ceil(abs(f_(root2))));
p = 0:0.1:2.3;
plot(p, f(p), p, f_(p));
