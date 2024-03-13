function newtraph(func,dfunc,xr,es,varargin)
if nargin<4|isempty(es),es=0.0001;end
iter = 0;
while(1)
    xrold=xr;    
    xr= xr - func(xr)/dfunc(xr);
    if xr~=0 ,ea= abs((xr-xrold)/xr)*100; end    
    fprintf("%d\t\t%f\t%f\n",iter+1,xr,ea);
    iter=iter+1;
    if iter>2|ea<=es ,break,end
end
    fprintf('newtraph Root: %f\n',xr);
end