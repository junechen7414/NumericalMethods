x=[0 2 4 6 9 11 12 15 17 19];
y=[5 6 7 6 9 8 8 10 12 12];
[xp,yp] =linregr(x,y);
subplot(2,1,1);
plot(x,y,'o',xp,yp);
grid on;
%change x,y :
[xp,yp] =linregr(y,x);
subplot(2,1,2);
plot(y,x,'o',xp,yp);
grid on;
function [xp,yp]= linregr(x,y)
sumx=sum(x); sumy=sum(y);
sumxy= sum(x.*y); sumxsqr = sum(x.^2);
sumysqr = sum(y.^2);
n = length(y);
a(1) = (n*sumxy - sumx*sumy)/(n*sumxsqr - sumx^2); %slope
a(2)= sumy/n - a(1)*mean(x); %intercept
sr=0;
for i= 1:n
    sr = sr+ (y(i)-a(1)-a(2)*x(i))^2;    
end
syslashx = sqrt(sr/(n-2));
r = (n*sumxy-sumx*sumy)/ sqrt(n*sumxsqr - sumx^2)/sqrt(n*sumysqr - sumy^2);
fprintf('slope:%f\tintercept:%f\tstd:%f\tcorrelationcoefficient:%f\n',a(1),a(2),syslashx,r);
xp = linspace(min(x),max(x),2);
yp= a(1).*xp+a(2);
end