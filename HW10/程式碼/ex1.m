clear,clc
v = [10 20 30 40 50 60 70 80];
F = [25 70 380 550 610 1220 830 1450];
N = [sum(v.^2) sum(v.^3);sum(v.^3) sum(v.^4)];
r = [sum(F.*v) sum(F.* (v.^2))]';
a = N\r;
Sr = 0; St = 0;
for i = 1:size(v)
    Sr = Sr+ (F(i) - a(1)*v(i) - a(2)*(v(i)^2))^2;
    St = St + (F(i)- mean(F))^2;
end
syslashx = sqrt(Sr/(length(v)-3));
r2 = (St -Sr)/St;
xp = linspace(min(v),max(v));
yp = a(1).*xp + a(2).*(xp.^2);
plot(v,F,'o',xp,yp); grid;
disp('r^2:');
disp(r2);
disp('std:');
disp(syslashx);
fprintf('F = %f*v + %f*v^2\n',a(1),a(2));