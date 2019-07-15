function [fx,fv]=calcf(x,v,fx,fv,N,L,a,c)
    for i=1:N
        if i~=N 
            dx=x(i+1)-x(i);     %dx是前后两车之间的距离
        else
            dx=x(1)-x(N);       %当是最后一辆车的时候，环形运行，
        end
        if dx<-L*0.5
            dx=dx+L;
        end
        if dx<0
           error('错误')
        end
        fv(i)=a*(tanh(dx-c)+tanh(c)-v(i));  %返回v的导函数值
    end
    for j=1:N
        fx(j)=v(j);         %返回x的导函数值
    end 
end