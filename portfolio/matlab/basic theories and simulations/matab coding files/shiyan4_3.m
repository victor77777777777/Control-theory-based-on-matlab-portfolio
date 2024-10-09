% %程序一：校正前后系统bode图比较
% clear,clc
% num11=[4];
% den11 =conv([1 0],[1 0.5]);
% sys1=tf(num11,den11);%校正前系统传函
% num21=[25 2.5]; %串联校正装置后传函的分子系数
% bode(sys1);
% hold on
% den21=conv(conv([1 5],[1 0.01]),[1 0]);%校正后装置传函分母系数 
% sys2=tf(num21,den21);%校正后系统传函
% bode(sys2);
% legend('校正前','校正后')
% 程序二：校正前后系统阶跃响应曲线图比较
clear,clc
num11=[4];
den11 =conv([1 0],[1 0.5]);
%校正后幅值相角幅值裕度和相角裕度
[Gm,Pm,Wcg,Wcp]=margin(num11,den11);
[num12,den12]=cloop(num11,den11);%校正前闭环传递函数
step(num12,den12)%校正前阶跃响应曲线
hold on
num21=[25 2.5]; %串联校正装置后传函的分子的系数
den21=conv(conv([1 5],[1 0.01]),[1 0]); %校正后装置传函的分母系数
%校正后幅值相角幅值裕度和相角裕度
[Gm1,Pm1,Wcg1,Wcp1]=margin(num21,den21) 
[num,den]=cloop(num21,den21);%校正后闭环传递函数
step(num,den)%校正后阶跃响应曲线
legend('校正前','校正后')