% Initialize
clear,clc,close all
format LONG

% Date 23/9-14

phi = 0:0.01:pi/2;

figure(1)
x = @(a) cos(a).^3;
y = @(a) 1.5.*sin(a)-sin(a).^3;
hold all
plot(x(phi),y(phi))
plot(-x(phi),y(phi))

[cx,cy] = createcircle([0,0], 1);
plot(cx,cy);

Points = [1,0;1,0.73;0.12,0.89;0,0.5];
[bx,by] = bezier(Points);
plot(bx,by);
plot(-bx,by);

mouthPoints = [-0.6,-0.6;-0.3,-0.8;0.3,-0.8;0.6,-0.6];
[mouthx,mouthy] = bezier(mouthPoints);
plot(mouthx,mouthy);


[eyex1, eyey1] = createcircle([0.5 0.2], 0.15);
[pupilx1, pupily1] = createcircle([0.5 0.2], 0.03);
plot(eyex1, eyey1);
plot(pupilx1,pupily1);
[eyex2, eyey2] = createcircle([-0.5 0.2], 0.15);
[pupilx2, pupily2] = createcircle([-0.5 0.2], 0.03);
plot(eyex2, eyey2);
plot(pupilx2,pupily2);
title('Alien');

