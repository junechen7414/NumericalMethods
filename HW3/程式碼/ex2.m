fprintf("index\tresult\t\tet,%%\t\tea,%%\n");
cosine(pi/3);

function cosine(x)
    actual = cos(x); cosx = 1; et = abs((actual-cosx)/actual)*100;i = 1 ;
    es = 0.5*10^(2-3);
    fprintf("%d\t\t%f\t%f\n",i-1,cosx,et);
    while (1)        
        cosold = cosx;
        cosx = cosx + (-1)^i / factorial(2*i) * x^(2*i);
        et = abs((actual - cosx)/actual)*100;
        ea = (cosx - cosold)/cosx *100;
        fprintf("%d\t\t%f\t%f\t%f\n",i,cosx,et,abs(ea));
        i = i + 1;
        if abs(ea)<es , break,end
    end

end