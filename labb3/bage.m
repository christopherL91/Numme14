function s = bage( xs, ys )
    dx = xs(2:end) - xs(1:end-1);
    dy = ys(2:end) - ys(1:end-1);
    dydx = dy./dx;
    ds = dx .* sqrt(1+dydx.^2);
    s = sum(ds);
end

