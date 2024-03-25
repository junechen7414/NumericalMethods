clear,clc;
A=[0 2 5;2 1 1;3 1 0];
D = det(A);
disp("determinant:")
disp(D);
temp = A(:,1);
A(:,1) = [1 1 2];
D1 = det(A);
A(:,1)= temp;
temp=A(:,2);
A(:,2) = [1 1 2];
D2 = det(A);
A(:,2)= temp;
temp=A(:,3);
A(:,3) = [1 1 2];
D3 = det(A);
A(:,3)=temp;
x=[D1/D D2/D D3/D];
fprintf("\tx1\t\tx2\t\tx3\n");
disp(x);
b = [1 1 2]';
[xvec,aug] = GaussPivot(A,b);
disp('By Gauss Pivot');
disp(xvec');
fprintf("")
fprintf("2*8+5*-3 = 1\n");
fprintf("2*-2+8+-3 = 1\n");
fprintf("3*-2+8= 2\n");
disp("determinant Gauss")
disp(aug(1,1)*aug(2,2)*aug(3,3));
function [x,Aug] = GaussPivot(A,b)
[m,n] = size(A);
if m~=n, error('Matrix A must be squrare'); end
nb=n+1;
Aug =[A b];
for k = 1:n-1
    [big,i] = max(abs(Aug(k:n,k)));
    ipr = i+k-1;
    if ipr~=k
        Aug([k,ipr],:) = Aug([ipr,k],:);
    end
    for i = k+1:n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
    end
end
x=zeros(n,1);
x(n)=Aug(n,nb)/Aug(n,n);
for i = n-1:-1:1
    x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end
end