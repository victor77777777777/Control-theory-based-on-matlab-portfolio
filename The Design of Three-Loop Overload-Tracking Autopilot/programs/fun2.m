function [g,h]=fun2(x)
a1 = 1.5;
a2 = 250;
a4 = 1.6;

A1 = a1+a4;
A2 = a2+a1*a4;

wn1 = x(1)^2;
wn = x(3)/x(1);
zeta = x(2);
%改变截止频率
wcr = 50;

mp = wn1+2*zeta*wn-A1;
np = wn^2+2*zeta*wn*wn1-A2;
p = wn1*wn^2;

A = (p/wcr-mp*wcr)+np*1i;
B = (A2-wcr^2+A1*wcr*1i)*1i;

Ga = abs(B)/abs(A);
phi = x(4)-90-angle(A)/pi*180+angle(B)/pi*180;

Rp = sqrt((A2/wcr-wcr)^2+A1^2)/Ga;

g=[];
h = [x(1)^2+2*x(2)*x(3)/x(1)-A1-x(3)^2/wcr^2-Rp*cosd(x(4)+atand(A1*wcr/(A2-wcr^2))-phi-90);
    x(3)^2/x(1)^2+2*x(1)*x(2)*x(3)-A2-Rp*wcr*sind(x(4)+atand(A1*wcr/(A2-wcr^2))-phi-90)];


end
