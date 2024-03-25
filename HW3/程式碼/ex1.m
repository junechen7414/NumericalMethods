% 1.(a)
%format long; 3digit chopping format short (default) is good
y = 1.37^3 - 7*1.37^2 + 8*1.37 -0.35;
app= chop3(y);
et = abs((y-app)/y)*100;
fprintf("et = %.3f %%\n",et);

% 1.(b)
correct =((1.37-7)*1.37 + 8)*1.37-0.35;
%app = chop3(correct);
app = chop3((chop3((1.37-7)*1.37)+8)*1.37)-0.35;
et = abs((correct-app)/correct)*100;
fprintf("et = %.3f %%\n",et);

function y = chop3(x)
    y = floor(x*1000)/1000;
end