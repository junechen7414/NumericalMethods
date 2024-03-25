clear,clc
x = [1 2 3 5 6];
y =[4.75 4 5.25 19.75 36];
disp('Newtint:');
yint = Newtint(x,y,4);
disp('Newtint yint:');
disp(yint);
x1=[3 5];
y1=[5.25 19.75];
x2=[2 3 5];
y2=[4 5.25 19.75];
x3=[2 3 5 6];
y3=[4 5.25 19.75 36];
disp('Lagrange:');
yint =Lagrange(x1,y1,4);
fprintf('order1 yint=%f\n',yint);
yint= Lagrange(x2,y2,4);
fprintf('order2 yint=%f\n',yint);
yint= Lagrange(x3,y3,4);
fprintf('order3 yint=%f\n',yint);
p= polyfit(x,y,4);
yint = polyval(p,4);
fprintf('\nmatlab:%f\n',yint);