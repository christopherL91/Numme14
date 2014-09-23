function calligraphyplot( x,y , opt)
    d = 0.5E-3;
    for k = 1:50
        plot(x+k*d,y+k*d, opt);
    end
end

