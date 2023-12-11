function [x1, n] = LapDon(f, g, a, b, eps)   
    fx = str2func(['@(x)' ,f]);
    gx = str2func(['@(x)' ,g]);
    n = 1;
    x1 = 0;
    
    c=(a+b)/2;
    if fx(a)*fx(c)<0
        x0=a;
    else
        x0=b;
    end
    
    while(1)
        x1 = gx(x0);
        n = n+1;
        if abs(x1-x0) < eps
            break;
        end
        x0 = x1;
    end
end