clear,clc
x = [3 4 5 7 8 9 11 12]';
y= [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]';
z = [ones(size(x)) x x.^2 x.^3];
a = (z'*z)\(z'*y);
Sr = sum((y-z*a).^2);
r2 = 1-Sr/sum((y-mean(y)).^2);
disp('r^2');
disp(r2);
syslashx = sqrt(Sr/(length(x)-4));
disp('std:');
disp(syslashx);
xp = linspace(min(x),max(x));
yp =a(1)+  a(2).*xp + a(3).*(xp.^2)+ a(4).*(xp.^3);
plot(x,y,'o',xp,yp); grid;
fprintf("y= %f + %fx + %fx^2 + %fx^3\n",a(1),a(2),a(3),a(4));