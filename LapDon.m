function [x1, n, isHoiTu] = LapDon(f, g, a, b, eps)   
    fx = str2func(['@(x)',f]);
    gx = str2func(['@(x)',g]);
    syms x;
    n = 1;
    x1 = 0;
    isHoiTu = false;
    
    gdx = diff(gx,x);
    if subs(gdx, x, a) > subs(gdx, x, b)
        q = subs(gdx, x, a);
    else
        q = subs(gdx, x, b);
    end
    
    if q > 0 && q < 1
        isHoiTu = true;
    else
        return
    end
    
    
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