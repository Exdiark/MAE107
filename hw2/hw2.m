% x = [1 3 64 -1 -20 10 -15 19 5 2]
% min(x)
% minimum(x)

% n = bisection(0.05);
% -2*n^6 - 1.6*n^4 + 12*n + 1

% bop = fpos(.001)
% v(bop)

% fpoint(.0001)

graph()

% p7(1,.8,.9)

function out = minimum(x)
    out = x(1);
    for i=1:length(x)
        if(x(i) < out)
            out = x(i);
        end
    end
end

function out = bisection(err)
    xl = 0;
    xu = 1;

    n = ceil(log2((xu-xl)/err))
    
    for i=1:n
        xm = (xl + xu) / 2;
        ym = fp(xm);
        if ym > 0 
            xu = xm;
        else
            xl = xm;
        end
    end

    out = xm
end

function o = fp(x)
    o = -12*x^5 - 6.4*x^3 + 12;
end

function out = fpos(err)
    xa = 0;
    xb = 100;
    while true
        ya = v(xa);
        yb = v(xb);
        xm = xb - yb*(xb -xa)/(yb-ya);
        if v(xm) > 0
            xa = xm;
        else
            xb = xm;
        end
        
        if abs(v(xm)) <= err
            break
        end
    end
    out = xm;
end

function out = v(x)
    out = 35 - 9.8*x/15*(1-exp(-15*9/x));
end

function out = fpoint(err)
    x0 =.5;
    while true
        x1 = ffx(x0);
        relerr = (x1-x0)/x1;
        if relerr < err
            break
        end
        x0 = x1;
    end

    out = x1;
end

function out = ffx(x)
    out = 2*sin(sqrt(x));
end

function out = graph()
    e1 = [.0665,.0015,.0000,0,0];
    e2 = [.2706,.0006,0,0,0]
    e3 = [.2358,.0064,0,0,0]
    e4 = [.3677,.4239,.0602,.0078,.0002]
    x = [1,2,3,4,5]
    hold on
    plot(x,e1)
    plot(x,e2)
    plot(x,e3)
    plot(x,e4)
    hold off
end

function out = p7(x0,y0,z0)
    err =  .001;
    xm(1) = x0;
    xm(2) = y0;
    xm(3) = z0;
    xm = rot90(xm,3)

    while true
        x = xm(1);
        y = xm(2);
        z = xm(3);
        
        J = [x+.5*y+.5*z-1+x,.5*x,.5*x;...
             y+.5*x+.5*z-1+y,.5*y,.5*y;...
             z+.5*y+.5*z-1+z,.5*z,.5*z];

        fx = [x*(x+0.5*y+0.5*z-1);...
              y*(y+0.5*x+0.5*z-1);...
              z*(z+0.5*x+0.5*y-1)];
        
        if abs(fx(1)) < err && abs(fx(2)) < err && abs(fx(3)) < err
            break
        end

        J = J/det(J)

        if J==0
            break
        end

        J = J/det(J)
        xn = xm - inv(J)*fx
        xm = xn;

        
    end
end
    