function x=DS_fusion(x,y)

%���ܣ��ں�x,y��������

[nx,mx]=size(x);
if 1~=nx
    disp('xӦΪ������');
    return;
end

[ny,my]=size(y);
if 1~=ny
    disp('yӦΪ������');
    return;
end

if mx~=my
    disp('x,y����Ӧ���');
    return;
end

temp=0;
for i=1:mx-1
    x(1,i)=x(1,i)*y(1,i)+x(1,i)*y(1,mx-1)+y(1,i)*x(1,mx-1);
    if i==mx-1
        x(1,i)=x(1,i)*y(1,i);
    end
    temp=temp+x(1,i);
end

for i=1:mx-1
    x(1,i)=x(1,i)/temp;
end

x(1,mx)=0;
end