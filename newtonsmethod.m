
%Secant Method of root finding
n=100;
x0=input('initial approximation : ');
fprintf('Iteration        X\n')
fprintf('================================\n')
i=0;
fprintf('%5i %15.7f\n',i,x0);
for i=1:n
    x=x0-((nf(x0)*nfp(x0))/((nfp(x0))^2-(nf(x0)*nf2(x0))));
    fprintf('%5i %15.7f\n',i,x);
    if(abs(x-x0)<.000001)
        fprintf('\n The solution is: %15.7f\n',x);
        fprintf(' and Solution found at iteration no: %4i \n',i);
        break
    end
 
    x0=x;
end

if (i==n)
    fprintf('No solution found up to given iteration\n')
end
