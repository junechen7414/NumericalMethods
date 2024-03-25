clear,clc
A = [8 2 -10 ; -9 1 3 ; 15 -1 6];
[m,n] = size(A);
if m~=n, error('Matrix A must be squrare'); end
big = -1;
for i = 1:m
    for j= 1:n
        temp=abs(A(i,j));
        if(temp>big)
            big = temp;            
        end
    end
    M(i)=big;
    big=-1;
end

sum =0; Ainf = -1;
for i= 1:m 
    for j = 1:n
        A(i,j) = A(i,j)/M(i);
        sum = sum +abs(A(i,j));
    end
    if(sum>Ainf)
        Ainf = sum; 
    end
    sum =0;
end
disp('Ainf'); disp(Ainf);
sum =0; A1= 0;
for i = 1:m
    for j = 1:n
        sum = sum +abs(A(j,i));
    end
    if(sum > A1)
        A1 = sum;
    end
    sum = 0;
end
disp('A1');disp(A1);
Af= 0;
for i = 1:m
    for j = 1:n
        Af = Af + A(i,j)*A(i,j);
    end 
end
Af = sqrt(Af);
disp('Af'); disp(Af);