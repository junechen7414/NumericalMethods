clear,clc
Q =[0.04 0.24 0.69 0.13 0.82 2.38 0.31 1.95 5.66]';
D=[0.3 0.6 0.9 0.3 0.6 0.9 0.3 0.6 0.9]';
S=[0.001 0.001 0.001 0.01 0.01 0.01 0.05 0.05 0.05]';
logQ = log10(Q); logD = log10(D); logS = log10(S);
z = [ones(size(logQ)) logD logS];
a = (z'*z)\(z'*logQ);

fprintf("logQ = %f + %fD + %fS\n",a(1),a(2),a(3));
disp('or');
fprintf('Q = %f * D^%f * S^%f\n',10^a(1),a(2),a(3));
xp = linspace(min(D),max(D));
yp = linspace(min(S),max(S));
fp = 10^a(1).*xp.^a(2).*yp.^a(3);
plot3(D,S,Q,'o',xp,yp,fp);hold on;
b = fminsearch(@qds,[1 1 1],[],Q,D,S);
disp('or by fminsearch');
fprintf('Q = %f * D^%f * S^%f\n',b(1),b(2),b(3));
fp2 = b(1).*xp.^b(2).*yp.^b(3);
plot3(D,S,Q,'o',xp,yp,fp2); grid;
function f = qds(A,Q,D,S)
    yp = A(1)*D.^A(2).*S.^A(3);
    f = sum((Q-yp).^2);
end