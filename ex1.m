fprintf("term\tresult\t\tet.%%\t\tea,%%\n");
IterMeth(0.5,0.05,50);

function IterMeth(x,es,maxit)
%default values
if nargin <2 | isempty(es) es=0.0001; end
if nargin < 3 | isempty(maxit) maxit=50; end

iter = 1 ; sol = 1 ; ea = 100; et=100;
first = 1;
firstet= (exp(x)-1)/exp(x)*100;
fprintf("%d\t\t%f\t%f\n",iter,first,firstet);  
while(1)
    solold = sol ;
    sol = sol + x^iter / factorial(iter);    
    et = (exp(x)-sol)/exp(x)*100;
    if sol~= 0 
        ea = abs((sol-solold)/sol)*100;
    end    
    fx=sol;
    iter = iter+1;    
    fprintf("%d\t\t%f\t%f\t%f\n",iter,fx,et,ea);    
    if ea<=es | iter>= maxit ,break,end
end
end