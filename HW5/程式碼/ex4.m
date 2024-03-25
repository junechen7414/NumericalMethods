clear,clc
fx=@(x) exp(-0.5*x).*(4-x)-2;
epsilon = 1e-10;
dfx = @(x) (fx(x+epsilon) - fx(x)) / epsilon;
fprintf('index\txr\t\t\tea\n');
newtraph(fx,dfx,2);
newtraph(fx,dfx,6);
newtraph(fx,dfx,8);
[x,f]= fzero(fx,2);
disp('Answer');
disp(x); disp(f);
[x,f]= fzero(fx,6);
disp('Answer');
disp(x); disp(f);
[x,f]= fzero(fx,8);
disp('Answer');
disp(x); disp(f);

x = linspace(-1,2);
f = exp(-0.5.*x).*(4-x)-2;
plot(x,f);grid;