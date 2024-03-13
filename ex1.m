clear,clc
x = [0 1 2.5 3 4.5 5 6];
y= [2 5.4375 7.3516 7.5625 8.4453 9.1875 12];
yi = Newtint(x,y,3.5);
disp('f(3.5):');
disp(yi);
p = polyfit(x,y,length(x)-1);
yi = polyval(p,3.5);
disp('by matlab');
disp(yi);