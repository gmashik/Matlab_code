%A=[2,4,1;2 1 3;5 4 -2];
format long
A=[.001,2,3;-1,3.712,4.623;-2,1.072,5.643];
n=length(A);
L=eye(n);
for k=1:n-1
col=A(k:n,k);
[f,index]=max(abs(col));
%Pivoting condition 
if abs(A(k,k))<abs(f) 
%Pivoting start
t=A(k,:);
A(k,:)=A(index,:);
A(index,:)=t;
%end of pivoting
end
for i=k+1:n
     apx=A(i,k)/A(k,k);
     L(i,k)=apx;
     A(i,:)=A(i,:)-apx*A(k,:);
end
end
%Creating Upper triangular Matrix
U=A(1:n,1:n);
%Lower Triangular Matrix
fprintf('The Lower triangular Matrix\n')
disp(L)
%Upper Triangular Matrix
fprintf('\nThe Upper triangular Matrix\n')
disp(U)
L*U