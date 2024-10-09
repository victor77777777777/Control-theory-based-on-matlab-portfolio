% clear,clc
% y1(1)=1/3;
% h=0.1;%步长h=0.1
% k=1;
% for t=h:h:1.5
%     k=k+1;
%     y1(k)=y1(k-1)+(-30)*y1(k-1)*h;
% end
% x=0:h:1.5;
% plot(x,y1,'k')

clear,clc
f=inline('-30*y','t','y'); %微分方程表达式
h=0.1; %步长h
n=1+1.5/h; %t点的个数
y(1)=1/3;t(1)=0;
for i=2:n
    k1=f(t(i-1),y(i-1));
    k2=f(t(i-1)+h/2,y(i-1)+k1*h/2);
    k3=f(t(i-1)+h/2,y(i-1)+k2*h/2);
    k4=f(t(i-1)+h,y(i-1)+k3*h);
    y(i)=y(i-1)+h*(k1+2*k2+2*k3+k4)/6;
    t(i)=t(i-1)+h;
end
plot(t,y)

% t=0:0.00001:1.5;
% y=exp(-30*t)/3;%解析表达式
% plot(t,y)