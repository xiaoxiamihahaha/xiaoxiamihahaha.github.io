function [CombinedResult] =WY_DsFusion(Matrix1,Matrix2)
%���ܣ�����������������ɵ��µ�֤�����ֵ
%���������
%Matrix1            ����������1��Ϊ��ֵ����������
%Matrix2            ����������2��Ϊδ֪����������
%���������   
%CombinedResult     ��Ͻ��
%���ߣ�WY
[sizeRow1 sizeCol1]=size(Matrix1);
if sizeRow1~=1
    disp('Matrix1ӦΪ������');
    return;
end
[sizeRow2 sizeCol2]=size(Matrix2);
if sizeRow2~=1
    disp('Matrix2ӦΪ������');
    return;
end
if sizeCol1~=sizeCol2
    disp('Matrix1��Matrix2������Ӧ�����');
    return
end
%�������ϵ��Coefficient
c1=1;
c2=1;
for i=1:1:sizeCol1
    c1=c1*Matrix1(1,i);
end
for j=1:1:sizeCol2
    c2=c2*Matrix2(1,j);
end
Coefficient=c1+c2;
%������ֵ������δ֪����
IsTrue=c1/Coefficient
UnKnown=c2/Coefficient
end

