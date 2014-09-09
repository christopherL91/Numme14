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
y = 1:0.1:3; z = y;
[Y,Z] = meshgrid(y,z);

A = @(y,z) sin((-2.^y+z.^3)/3) + y.^2 + log10(z) - 3;
B = @(y,z) ((-2.^y+z.^3)/3).^2 + y.^2 + z.^3 - 6;

phi = @(y,z) A(y,z)^2 + B(y,z)^2;

surfc(Y,Z,phi(Y,Z))

% guess1 = [8,1,1];
% res = raphsonJacobian(guess1,J_F,F,1E-6);
% res
% guess2 = [8,8,9];
% res = raphsonJacobian(guess2,J_F,F,1E-6);
% res
% guess3 = [0.45,0.15,1.35];
% res = raphsonJacobian(guess3,J_F,F,1E-6);
% res