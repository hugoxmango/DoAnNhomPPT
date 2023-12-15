function [c,n,isHoiTu] = ChiaDoi(fx, a, b, saiso)
    fxi=str2func(['@(x)',fx]);
    n=0;
    isHoiTu = false;
    if fxi(a)*fxi(b)>0
        c=NaN;
        return
    else
        isHoiTu = true;
    end
    
    if fxi(a)==0
        c=a;
        return
    elseif fxi(b)==0
        c=b;
        return
    end
    
    while(abs(a-b)>=saiso)
        c=(a+b)/2;
        if fxi(a)*fxi(c)<0
            b=c;
        else
            a=c;
        end
        n=n+1;
    end
end