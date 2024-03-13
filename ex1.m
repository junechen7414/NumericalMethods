clear,clc
fx = @(x) x^3-6*x^2+11*x-6.1;
dfx= @(x) 3*x^2-12*x + 11;

x = linspace(0.5,3.5);
f= x.^3-6.*x.^2 + 11.*x-6.1;
p= plot(x,f);grid;
datatip(p,3.05,0);
datatip(p,1.9,0);
datatip(p,1.05,0); 

fprintf('index\txr\t\t\tea\n');
newtraph(fx,dfx,3.5);
secant(fx,2.5,3.5);
msecant(fx,3.5,0.01);

x = roots([1 -6 11 -6.1]);
disp('Matlab answer');
disp(x);