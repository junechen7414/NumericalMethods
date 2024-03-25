clear,clc
x = linspace(-5,5); y = linspace(-5,5);
f = x.^2+y.^2-5;
f2 = x.^2-y-1;
plot3(x,y,f);
hold on;
plot3(x,y,f2);
grid;

x = [1.5;1.5];
f =@(x) [x(1)^2+x(2)^2-5;x(1)^2-x(2)-1];
f1 = @(y) sqrt(y+1);
f2 = @(x) sqrt(5-x^2);
J =@(x) [2*x(1) 2*x(2);2*x(1) -1];
disp('-----successive substitution-----');
fprintf('i\txold\t\tx\t\t\teax\t\t\tyold\t\ty\t\t\teay\n');
succsub(f1,f2,x(1),x(2),0.1);
disp('-----newtraph-----');
newtmult(f,J,x,0.1);
function newtmult(func1,func2,x0,es)
iter = 0;
x = x0;
while(1)
    f = func1(x);
    J= func2(x);
    dx = J\f;
    x =x -dx;
    iter = iter+1;
    m= size(x);
    fprintf('x\t\t\ty\n');
    for i=1:m
        fprintf('%f\t',x(i));
    end
    fprintf('\n');
    ea = 100*max(abs(dx./x));    
    fprintf('minea: %f\n',ea);
    if ea<=es,break,end
end
end
