function [L,U,P]=LU_pivot(A) 
% L, U, and P are output of the program
% A is the input matrix or argument to the function
[m,n]=size(A); % checking the size of matrix
if m~=n, error('Matrix A must be squrare'); end
L=eye(n); P=L; U=A;
for k=1:n-1 
    [pivot i]=max(abs(U(k:n,k))); % pivoting process
    i=i+k-1; % pivot index   
    if i~=k
        % interchange rows m and k in U
        temp=U(k,:); 
        U(k,:)=U(i,:);
        U(i,:)=temp;
        % interchange rows m and k in P
        temp=P(k,:);
        P(k,:)=P(i,:);
        P(i,:)=temp;
        if k >= 2
            temp = L(k,1:k-1);
            L(k,1:k-1) = L(m,1:k-1);
            L(m,1:k-1) =temp;
        end
    end
    for j=k+1:n 
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end
end