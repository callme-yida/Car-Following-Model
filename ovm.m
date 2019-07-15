%function ovm()
clc;
clear;
N=10;       %10辆车
L=20;       %系统大小
dt=0.05;    %时间精度
c=2.0;      %安全距离
t=500;      %仿真时间
b=L/N;      %密度
a=2.5;      %敏感系数
s_time=0;   %仿真时间
x=zeros(1,N);   %每个车辆的位置
v=zeros(1,N);   %每个车辆的速度
tx=zeros(1,N);  %rk法过程中位置数据
tv=zeros(1,N);  %rk法过程中速度数据
fx=zeros(1,N);  %fx,导数的初始值
fv=zeros(1,N);  %fv，导数的初始值
eps=0.1;    %初始振幅0.1
jx=zeros(t/dt,N);   %记录所有车辆每一仿真时刻的位置信息
jv=zeros(t/dt,N);   %记录所有车辆每一仿真时刻的速度信息

%对初始均匀车流施加小扰动
for i=1:N
    x(i)=b*(i-1)+eps*rand(1,1);     %初始位置加扰动
%    x(i)=b*(i-1);                   %初始位置不加扰动项
    v(i)=tanh(b-c)+tanh(c);         %车距间的最佳速度
end

%每个仿真时刻的所有车辆的位置，速度
for j=1:t/dt
   %calcf  求x、v的倒数fx,fv
   %integrate(x,v)  
   [x,~]=integrate_RungeKutta(x,v,fx,fv,N,L,a,c,dt,tx,tv);    %采用龙格库塔法求出导函数数值解
   [~,v]=integrate_RungeKutta(x,v,fx,fv,N,L,a,c,dt,tx,tv);    %因为只有导函数，没有原函数，无法直接求解析解
   jx(j,:)=x;
   jv(j,:)=v;
   
   for k=1:N
     if x(k)>L
         x(k)=x(k)-L;    %循环运行的边界条件，超过系统长度后该车位置从0开始
     end
   end 
end



%end