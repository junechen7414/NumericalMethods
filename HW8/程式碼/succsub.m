function succsub(f1,f2,x0,y0,es)
    iter = 0;
    x = x0; y =y0;
    while(1)
        xold = x;
        x= f1(y);
        ea1= abs((x - xold)/x)*100;
        iter = iter+1;        
        yold = y;
        y = f2(x);
        ea2 = abs((y-yold)/y)*100;
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n',iter,xold,x,ea1,yold,y,ea2);
        fprintf('maxea: %f\n',max(ea1,ea2));
        if max(ea1,ea2)<=es,break,end
    end
end