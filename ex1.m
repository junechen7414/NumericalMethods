clear,clc
A = [2 -6 -1;-3 -1 7;-8 1 -2];
b = [-38;-34;-40];
[L,U,P] = LU_pivot(A);
disp('L:'); disp(L);disp('U:'); disp(U);disp('P:'); disp(P);
[d,x] = forward_back(L,U,b,P);
disp('d:'); disp(d);disp('x:'); disp(x);