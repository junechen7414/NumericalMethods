k = 0;
for i = 0:20
    xb=incsearch(@(x) cos(2*x)+sin(6*x),1,6,k);
    k = k +1;
    disp(xb);
end
function xb = incsearch(func,xmin,xmax,ns)
if nargin < 3 , error('at least 3 arguments required'), end
if nargin<4,ns=50; end

x= linspace(xmin,xmax,ns);
f= func(x);
nb = 0; xb=[];
for k=1:length(x)-1
    if sign(f(k))~=sign(f(k+1))
        nb=nb+1;
        xb(nb,1)=x(k);
        xb(nb,2)=x(k+1);
    end
end
if isempty(xb)
    disp('no brackets found');
else
    disp("number of brackets:");
    disp(nb);      
end
end