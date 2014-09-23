function [ x,y ] = createcircle( center, radius )
    t = linspace(0,2*pi);
    x = radius*cos(t) + center(1);
    y = radius*sin(t) + center(2);
end

