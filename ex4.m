x= linspace(0,10); %range: positive real number
f= log(x.^2)-0.7;
p=plot(x,f);grid;
datatip(p,1.4,0);
fm= @(m) log(m.^2)-0.7;
fprintf('index\txl\t\t\txu\t\t\txr\t\t\tea\n');
bisect(@(m) fm(m),0.5,2);
fprintf('index\txl\t\t\txu\t\t\txr\t\t\tea\n');
falsect(@(m) fm(m),0.5,2);
function bisect(func,xl,xu,es,varargin)
if nargin < 3 , error('at least 3 input arguments'),end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0, error('no sign change'),end
if nargin < 4 | isempty(es),es=0.01;end
iter = 0;xr=xl;ea = 100;
fprintf("---bisection method---\n")
while(1)
    if iter > 2  , break,end
    xrold=xr;
    xr=(xl+xu)/2;    
    if xr~=0,ea =abs((xr-xrold)/xr) * 100;end
    test = func(xl,varargin{:})* func(xr,varargin{:});
    fprintf('%d\t\t%f\t%f\t%f\t%f\n',iter+1,xl,xu,xr,ea);
    iter = iter + 1;
    if test < 0
        xu=xr;
    elseif test > 0
        xl=xr;
    else
        ea=0;
    end
    
end
    fprintf('root : %f\n',xr);
end

function  falsect(func,xl,xu,es,varargin)
if nargin < 3 , error('at least 3 input arguments'),end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0, error('no sign change'),end
if nargin < 4 | isempty(es),es=0.01;end
iter = 0;xr=xl; ea = 100;
fprintf("---false-position formula---\n");
while(1)
    if iter > 2  , break,end
    xrold=xr;
    xr=xu -(func(xu,varargin{:})*(xl-xu)/(func(xl,varargin{:})-func(xu,varargin{:})));    
    if xr~=0,ea =abs((xr-xrold)/xr) * 100; end
    fprintf('%d\t\t%f\t%f\t%f\t%f\n',iter+1,xl,xu,xr,ea);
    iter = iter + 1;
    test = func(xl,varargin{:})* func(xr,varargin{:});
    if test < 0
        xu=xr;
    elseif test > 0
        xl=xr;
    else
        ea=0;
    end
    
end
    fprintf('root: %f\n',xr);
end