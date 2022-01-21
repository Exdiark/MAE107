clear
i= 0;
x0 = 0
x1 = 2
perror = .001

while true
    x2 = x1 - f(x1)/( (f(x1) - f(x0))/(x1-x0));
    i = i+1;
    err(i) = abs(f(x2));
    if err(i) < perror
        break
    end
    x0 = x1;
    x1 = x2;
end

i
err
x2
f(x2)

function out = f(x)
    out = (2-x)*exp(-.5*x) + .05*x - 1;
end