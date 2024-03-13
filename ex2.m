cosine(0.9,8); %use sine function

function cosine(x,index)
%cosine approximate
cosx = cos(pi/4); point5 = 0.5;et = abs((point5- cosx)*2)*100;
fprintf("n\tf(x)^(n)\tf(pi/3) \tabs(et)\n");
fprintf("0\tcosx\t\t%f\t%f\n",cosx,et);
for i = 1 : 6          
     switch(mod(i,4))
         case 0 
             cosx = cosx + cos(pi/4)* (pi/12)^i * factorial(i)^-1;
             et = abs((point5- cosx)*2)*100;
             fprintf("%d\tcosx\t\t%f\t%f\n",i,cosx,et);
         case 1
             cosx = cosx + -sin(pi/4)* (pi/12)^i * factorial(i)^-1;
             et = abs((point5- cosx)*2)*100;
             fprintf("%d\t-sinx\t\t%f\t%f\n",i,cosx,et);
         case 2
             cosx = cosx + -cos(pi/4)* (pi/12)^i * factorial(i)^-1;
             et = abs((point5- cosx)*2)*100;
             fprintf("%d\t-cosx\t\t%f\t%f\n",i,cosx,et);
         case 3
             cosx = cosx + sin(pi/4)* (pi/12)^i * factorial(i)^-1;
             et = abs((point5- cosx)*2)*100;
             fprintf("%d\tsinx\t\t%f\t%f\n",i,cosx,et);
     end
 end
end