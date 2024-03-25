volume = 4/3 * pi * 1^3; %ball volume
volume = volume * 1000/(1000+200) ; %ball volume on the water using two density
fm = @(V,h,r) V-pi*(h^2)*(r-h/3);
h = linspace(-1,2.5);
f = volume -pi.* (h.^2) .* (1-h/3);
p= plot(h,f);grid;
datatip(p,-0.9,0);
datatip(p,1.48,0);
datatip(p,2.4,0);
fprintf('index\txl\t\t\txu\t\t\txr\t\t\tea\n');
fprintf("---root1---\n")
bisect(@(h) fm(volume,h,1),-1,-0.5,0.5);
fprintf("---root2---\n")
bisect(@(h) fm(volume,h,1),1,2,0.5);
fprintf("---root3---\n")
bisect(@(h) fm(volume,h,1),2,2.5,0.5);

function bisect(func,xl,xu,es,varargin)
if nargin < 3 , error('at least 3 input arguments'),end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0, error('no sign change'),end
if nargin < 4 | isempty(es),es=0.0001;end
iter = 0;xr=xl;ea = 100;
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
fprintf('root : %f\n',xr);
end