r = input('输入=');
P = input('传递函数p=');
W = input('W=');
W0= input('W0=');
Wc= input('Wc=');
Tf=input('输入仿真时间Tf：');
h=input('输入计算步长h：');
A1=diag(P(:,1));
B1=diag(P(:,2));
C1=diag(P(:,3));
D1=diag(P(:,4));
H=B1-D1*W;
Q=C1*W-A1;
A=inv(H)*Q;
B=inv(H)*C1*W0;
x=[zeros(length(A),1)];
y=[zeros(length(Wc(:,1)),1)];
t=0;
for i=1:Tf/h
    k1=A*x+B*r;
    k2=A*(x+h*k1/2)+B*r;
    k3=A*(x+h*k2/2)+B*r;
    k4=A*(x+h*k3)+B*r;
    x=x+h*(k1+2*k2+2*k3+k4)/6;
    y=[y,Wc*x];
    t=[t,t(i)+h];
end
plot(t,y)