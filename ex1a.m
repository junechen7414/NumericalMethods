A= [ 0.8 -0.4 0;-0.4 0.8 -0.4;0 -0.4 0.8];
b = [41;25;105];
disp('a:');
fprintf('iter\tx\t\t\tea\n');
xa= GaussSeidel(A,b,0.1);
disp('b:');
fprintf('iter\tx\t\t\tea\n');
xb = GaussSeidelrelax(A,b,1.2,0.1);

function x = GaussSeidel(A,b,es)
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
        if x(i)~=0
            ea(i) = abs((x(i)-xold(i))/x(i))*100;            
        end
        fprintf('%d\t%f\t%f\n',iter+1,x(i),ea(i));
    end
    iter = iter+1;
    if max(ea)<=es , break,end
end
end