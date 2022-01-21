clear
i= 0;
x0 = 7
perror = .001

while true
    x1 = x0 - f(x0)/fp(x0);
    i = i+1;
    err(i) = abs(f(x1));
    if err(i) < perror
        break
    end
    x0 = x1;
end

i
err
x1
f(x1)

function out = f(x)
    out = (2-x)*exp(-.5*x) + .05*x - 1;
end

function out = fp(x)
    out = -((2-x)*exp(-x/2))/2 - exp(-x/2) + .05;
end