clc
clear

%Uppgift 6

F = @(x) [
                sin(x(1))+x(2)^2+log(x(3))-3;
                3*x(1)+2^x(2)+-x(3)^3;
                x(1)^2+x(2)^2+x(3)^3-6
         ];
J_F = @(x) [
                cos(x(1)),2*x(2),1/x(3);
                3,(2^x(2))*log(2),-3*x(3)^2;
                2*x(1),2*x(2),3*(x(3)^2)
           ];

% Plot ranges
y = -2:0.01:2.5;
z = 0.2:0.01:1.7;
[Y,Z] = meshgrid(y,z);

A = @(y,z) sin((-2.^y+z.^3)/3) + y.^2 + log10(z) - 3;
B = @(y,z) ((-2.^y+z.^3)/3).^2 + y.^2 + z.^3 - 6;

test = @(x,y,z) [sin(x) + y^2 + log10(z);3*x + 2^y - z^3;x^2 + y^2 + z^3];
guess1 = [8,1,1];
p1 = raphsonJacobian(guess1,J_F,F,1E-8)
% t1 = test(res(1),res(2),res(3))'
guess2 = [8,8,9];
p2 = raphsonJacobian(guess2,J_F,F,1E-8)
% t2 = test(res(1),res(2),res(3))'

guess3 = [-1.33,2,0.2];
p3 = raphsonJacobian(guess3,J_F,F,1E-8)
% t3 = test(res(1),res(2),res(3))'

X = @(y,z) (-2^y + z^3)/3;

guess4 = [X(2,0.9)  2   0.9];
p4 = raphsonJacobian(guess4,J_F,F,1E-8)

phi = @(y,z) A(y,z).^2 + B(y,z).^2;
clf;
p = phi(Y,Z);
index=(p>0.05);
p(index) = inf;
subplot(1,2,1);
contour(Y,Z,p);
xlabel('Y');
ylabel('Z');
hold on;
plot3(p1(2), p1(3),p1(1), 'marker', 'o');
plot3(p2(2), p2(3),p2(1), 'marker', 'o');
plot3(p3(2), p3(3),p3(1), 'marker', 'o');
plot3(p4(2), p4(3),p4(1), 'marker', 'o');
hold off;
subplot(1,2,2);
surfc(Y,Z,p);



% t4 = test(res(1),res(2),res(3))'