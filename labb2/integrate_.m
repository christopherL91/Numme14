function result = integrate_(low,high,func,h)
%This function will integrate a funtion from low to high using
%numerical methods.
% @ intervalv is an integer.
% @ low and high is an integer.
% @ func is a function handler to the actual function to integrate.
% @ h is the lenght of steps.
intervalv = floor((high-low)/(h));
result = zeros(1);
for i = 1:intervalv
    current = low + (i-1)*h;
    if i == intervalv
        val = (func(current) + func(high))/(2);
        result(i) = val;
    else
        next = low + ((i+1)-1)*h;
        val = (func(current) + func(next))/(2);
        result(i) = val;
    end
end
result = h*sum(result);
end