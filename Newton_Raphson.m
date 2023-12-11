function [xi, k] = Newton_Raphson(f, a, b, eps)
    k = 1;
    syms x;
    fx = str2func(['@(x)' f]);

    % Tính đạo hàm của f
    dfx1 = diff(fx, x);
    dfx2 = diff(dfx1,x);
    g = matlabFunction(dfx1);
    h = matlabFunction(dfx2);
    for t = linspace(a,b)
        if fx(t)*h(t) > 0
            x0 = t;
        end
    end
    
    xn = zeros(1, 50);
    xn(1) = x0 - fx(x0)/g(x0);

    for i = 1:50
        xn(i+1) = xn(i) - fx(xn(i))/g(xn(i));
        k = k + 1;
        if abs(xn(i+1) - xn(i)) < eps
            break;
        end
    end
    xi = xn(k);
end
