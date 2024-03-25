sine(0.9,8); %use sine function

function sine(x,index)
%sine: infinite sine series
sinx = 0; sinpoint9 = sin(0.9); 
fprintf('index  approx.value  \terror\n');
 for i = 0 : index-1
     sinx = sinx + ((-1)^i/factorial(2*i+1)* x^ (2*i +1));
     fprintf('  %d\t\t%f\t\t%f%%\n',i+1,sinx,abs(sinpoint9-sinx)*sinpoint9^-1 *100);     
 end
end