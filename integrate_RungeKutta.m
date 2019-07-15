function [x,v]=integrate_RungeKutta(x,v,fx,fv,N,L,a,c,dt,tx,tv)
[kx1,kv1]=calcf(x,v,fx,fv,N,L,a,c);     %计算k1导数

for i=1:N
    tx(i)=x(i)+kx1(i)*dt*0.5;
    tv(i)=v(i)+kv1(i)*dt*0.5;
end    
[kx2,kv2]=calcf(tx,tv,fx,fv,N,L,a,c);   %计算k2导数

for i=1:N
    tx(i)=x(i)+kx1(i)*dt*0.5;
    tv(i)=v(i)+kv1(i)*dt*0.5;
end    
[kx3,kv3]=calcf(tx,tv,fx,fv,N,L,a,c);   %计算k3导数

for i=1:N
    tx(i)=x(i)+kx1(i)*dt*0.5;
    tv(i)=v(i)+kv1(i)*dt*0.5;
end    
[kx4,kv4]=calcf(tx,tv,fx,fv,N,L,a,c);   %计算k4导数

for i=1:N
    x(i)=x(i)+(kx1(i)+2.0*kx2(i)+2.0*kx3(i)+kx4(i))/6.0*dt; %计算数值解
    v(i)=v(i)+(kv1(i)+2.0*kv2(i)+2.0*kv3(i)+kv4(i))/6.0*dt; %计算数值解
end   

end

