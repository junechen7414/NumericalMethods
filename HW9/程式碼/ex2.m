x =[0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y=[0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];
a=linearize(x,y);
alpha = exp(a(2));
bata = a(1);
fprintf('y= %f*x*exp(%f*x)\n',alpha,bata);
function a= linearize(x,y)
    sumx=sum(x);sumlogy=sum(log(y)-log(x));sumxx =sum(x.^2);
    sumlogyy=sum((log(y)-log(x)).^2); sumlogyx= sum(x.*(log(y)-log(x)));
    n = length(x); meanx = sumx/n; meany = sumlogy/n;
    a(1) =(n*sumlogyx - sumx*sumlogy)/(n*sumxx - sumx^2);
    a(2)= meany - a(1)*meanx;
    xp = linspace(min(x),max(x));
    yp= a(1).*xp+ a(2);
    plot(x,log(y)-log(x),'o',xp,yp);
    grid on;
end