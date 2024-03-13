clear,clc
A = [15 -3 -1;-3 18 -6;-4 -1 12];
b = [4000;1200;2350];
[m n] = size(A);
if m~=n, error('Matrix A must be squrare'); end
I = eye(n);
[L,U,P] = LU_pivot(A);
for i = 1:n
    [d,x] = forward_back(L,U,I(:,i),P);
    inverse(:,i) = x;
end

disp('A inverse');
disp(inverse);
disp('matlab inv(A)');
disp(inv(A));
c= inverse * b;
disp('x :');
disp(c);
