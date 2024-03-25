clear,clc
fprintf('index\txr\t\t\tea\n');
msecant(@(x) x^3-6*x^2+11*x-6.1,1,10^-6);
msecant(@(x) x^3-6*x^2+11*x-6.1,2,10^-6);
msecant(@(x) x^3-6*x^2+11*x-6.1,3,10^-6);

function msecant(func,xr,delta,es,varargin)
if nargin<4|isempty(es), es=0.0001;end
iter = 0;
while(1)
    xrold=xr;    
    xr= xr - delta*xr*func(xr)/(func(xr+delta*xr)-func(xr));
    if xr~=0 ,ea= abs((xr-xrold)/xr)*100; end    
    fprintf("%d\t\t%f\t%f\n",iter+1,xr,ea);
    iter=iter+1;
    if ea<=es ,break,end
end
    fprintf('modified secant Root: %f\n',xr);
end