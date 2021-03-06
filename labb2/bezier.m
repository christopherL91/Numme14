function [x,y] = bezier(P)
% This function will calculate the cubic bezier curve over the
% linear space t for 4 points in P
    t = linspace(0,1)';
    res = bsxfun(@times,(1-t).^3,P(1,:)) + ...
        bsxfun(@times,3*(1-t).^2.*t,P(2,:)) + ...
        bsxfun(@times,3*(1-t).*t.^2,P(3,:)) + ...
        bsxfun(@times,t.^3,P(4,:));
    x = res(:,1);
    y = res(:,2);
end

