fm = @(m,cd,t,v) sqrt(9.81*m/cd)*tanh(sqrt(9.81*cd/m)*t)-v;
fprintf('index\txl\t\t\txu\t\t\txr\t\t\tea\n');
bisect(@(cd) fm(95,cd,9,46),0.2,0.5,0.1);
function bisect(func,xl,xu,es,varargin)
if nargin < 3 , error('at least 3 input arguments'),end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0, error('no sign change'),end
if nargin < 4 | isempty(es),es=0.0001;end
iter = 0;xr=xl;ea = 100;
fprintf("---bisection method---\n")
while(1)
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
    if ea<=es  , break,end
end
end