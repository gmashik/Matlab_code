format long
A=[.001,2,3;-1,3.712,4.623;-2,1.072,5.643];
n=length(A);
M=eye(n);
L=eye(n);
for k=1:n-1
for i=k+1:n
     apx=A(i,k)/A(k,k);
     L(i,k)=apx;
     A(i,:)=A(i,:)-apx*A(k,:);
end
disp(A)
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