function x = GaussSeidelrelax(A,b,lambda,es)
[m,n] = size(A);
C = A;
for i = 1:n
    C(i,i)=0;
    x(i)=0;
end
x=x';
for i = 1:n
    C(i,1:n) = C(i,1:n)/A(i,i);
    d(i) = b(i)/A(i,i);
end
iter=0;
while(1)
    xold = x;
    for i = 1:n
        x(i)=d(i)-C(i,:)*x;
        x(i) = lambda* x(i) + (1-lambda)*xold(i);        
        if x(i)~=0
            ea(i) = abs((x(i)-xold(i))/x(i))*100;
        end
        fprintf('%d\t%f\t%f\n',iter+1,x(i),ea(i));
    end
    iter = iter+1;
    if max(ea)<=es , break,end
end
end