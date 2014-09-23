% Initialize
clear,clc,close all
format LONG

% Date 23/9-14

t = linspace(0,1)';

p = [0,0;0.1,0.4;2,3;1,-0.2];
%plot(p(:,1),p(:,2),'o-r');
[x,y] = bezier(p);
hold all
calligraphyplot(x,y,'r');
p = [1,-0.2; 0.6,-1.5;-0.44,-1;-0.5,-4];
%plot(p(:,1),p(:,2),'o-r');
[x,y] = bezier(p);
calligraphyplot(x,y,'r');

p = [-0.5,-4;-0.5,0; -1.6, -1; -1.5,0];
%plot(p(:,1),p(:,2),'o-r');
[x,y] = bezier(p);
calligraphyplot(x,y,'r');

p = [-1.5,0;-1.4,1.5;-0.1,1;0,0];
%plot(p(:,1),p(:,2),'o-r');
[x,y] = bezier(p);
calligraphyplot(x,y,'r');