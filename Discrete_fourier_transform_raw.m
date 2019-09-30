%Function for Discrete Fourier Transform
n=20;
h=1/n;
x=0:h:1-h;
f=[];
y=zeros(n,1);

F=ones(n,n);
for m=2:n
    for j=2:n
        
        F(m,j)=exp(2*pi*(m-1)*(j-1)*i/n);
    end
    fprintf('\n ')
end
c=inv(F)*f;
fprintf('Discrete Fourier Coefficients are :\n')
imag(c)
fprintf('Functions Approximations using DFT:\n')
v=c;
for i=1:n
    y(i)=real(edp(x(i),n,v));
end
y
f'
er=abs(y-f)
plot(x,f)
hold on
plot (x,y)
plot(x,er)
% t = 0:1/255:1;
% x = exp(cos(2*pi*t));
% y = real(ifft(fft(x)));
% figure
% plot(t,x-y)

% figure
% plot(t,x-y)
% plot(x,abs(f-y))
