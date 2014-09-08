function f=flg2()
f= @(x) 60*x-(x.^2+x+0.1).^6./(x+1).^6-10*x.*exp(-x);
end