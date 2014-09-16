% Initialize
clear,clc,close all
format long

y = @(x) (exp(-x./3)./(2-cos(pi.*x)));

res = integrate_(1,5,y,1000);