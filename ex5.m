clear,clc
fx = @(x) -2*x^6 -1.5*x^4 + 10*x +2;
dfx = @(x) -12*x^5 -6*x^3 + 10;
x = linspace(0.5,1.2);
f = -2.*x.^6- 1.5.*x.^4+10.*x+2;
p = plot(x,f);grid;
datatip(p,0.87,9);
fprintf('index\txr\t\t\tea\n');
root = NTR(dfx,@(x) -60*x^4 -18*x^2,1,0.5);
disp('maxinmum:');
disp(fx(root));
x = roots([-12 0 -6 0 0 10]);
disp('Matlab roots');
disp(x);

function fx= NTR(func,dfunc,xr,es,varargin)
if nargin<4|isempty(es),es=0.0001;end
iter = 0;
while(1)
    xrold=xr;    
    xr= xr - func(xr)/dfunc(xr);
    if xr~=0 ,ea= abs((xr-xrold)/xr)*100; end    
    fprintf("%d\t\t%f\t%f\n",iter+1,xr,ea);
    iter=iter+1;
    if ea<=es ,break,end
end    
    fx = xr;
    fprintf('newtraph Root: %f\n',xr);
end