function secant(func,xr1,xr2,es,varargin)
if nargin<4|isempty(es), es=0.0001;end
iter = 0;
xrold=xr1;
xr = xr2;
while(1)        
    xrnew = xr - func(xr)* (xrold-xr) / (func(xrold)-func(xr));
    if xrnew~=0 ,ea= abs((xrnew-xr)/xrnew)*100; end        
    xrold=xr;
    xr = xrnew;
    fprintf("%d\t\t%f\t%f\n",iter+1,xr,ea);
    iter=iter+1;
    if iter>2|ea<=es ,break,end
end
    fprintf('secant Root: %f\n',xr);
end