function [d,x]= forward_back(L,U,b,P)
    Pb = P*b;
    [m,n] = size(L);
    nb=n+1;    
    d = [L Pb];
    for k = 1:n-1    
        for i = k+1:n
            factor = d(i,k)/d(k,k);
            d(i,k:nb)=d(i,k:nb)-factor*d(k,k:nb);
        end
    end
    x=zeros(n,1);
    x(n)=d(n,nb)/d(n,n);
    for i = n-1:-1:1
        x(i)=(d(i,nb)-d(i,i+1:n)*x(i+1:n))/d(i,i);
    end      
    d = x;
    Aug= [U x];
    for k = 1:n-1    
        for i = k+1:n
         factor = Aug(i,k)/Aug(k,k);
            Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
        end
    end    
    x(n)=Aug(n,nb)/Aug(n,n);
    for i = n-1:-1:1
        x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
    end
end