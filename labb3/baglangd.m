function langd = baglangd( xs, y_s )
    dx = xs(2:end)-xs(1:end-1);
    y_s2 = y_s(1:end-1).^2;
    ds = dx.*sqrt(1+y_s2);
    langd = sum(ds);
end