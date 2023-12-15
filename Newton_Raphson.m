function [xi, k, isHoiTu] = Newton_Raphson(f, a, b, eps)    
    syms x;
    fx = str2func(['@(x)' f]);
    
    xi = 0;
    k = 1;
    isHoiTu = false;
    % Tính đạo hàm của f
    g = matlabFunction(diff(fx, x));
    h = matlabFunction(diff(diff(fx, x), x));
    
    % Điều kiện hội tụ và chọn giá trị x0
    
    for t = linspace(a,b)
        if feval(fx, t) * feval(h, t) > 0 && feval(g, t) ~= 0
            x0 = t;
            isHoiTu = true;
            xn = zeros(1, 50);
            xn(1) = x0 - feval(fx, x0) / feval(g, x0);
            for i = 1:50
                xn(i+1) = xn(i) - feval(fx, xn(i)) / feval(g, xn(i));
                k = k + 1;
                if abs(xn(i+1) - xn(i)) < eps
                    xi = xn(k);
                    return;
                end
            end
        end
    end
end
