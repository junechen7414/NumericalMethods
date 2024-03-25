arctan(pi/6);

function arctan(x)
    actual = atan(x); arctanx = x;
    es = 0.5* 10^(2-2);
    fprintf("index\tarctanx\n");
    fprintf("0\t\t%f\n",arctanx);
    % 3.(a)
    for i = 1:3        
        arctanx = arctanx + -1^i / (2*i+1) * x^(2*i+1);           
        fprintf("%d\t\t%f\n",i,arctanx);
    end
    % 3.(b)
    fprintf("index\tresult\t\tet,%%\t\tea,%%\n");
    arctanx = x; et = abs((actual-arctanx)/actual)*100; i = 1;
    fprintf("%d\t\t%f\t%f\n",i-1,arctanx,et);
    while (1)        
        arctanold = arctanx;
        arctanx = arctanx + -1^i / (2*i+1) * x^(2*i+1);
        et = abs((actual-arctanx)/actual)*100;
        ea= (arctanx- arctanold)/arctanx*100;
        fprintf("%d\t\t%f\t%f\t%f\n",i,arctanx,et,abs(ea));
        i = i + 1;
        if abs(ea)<es , break,end
    end
end