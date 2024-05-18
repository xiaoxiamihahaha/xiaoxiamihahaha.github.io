function [CombinedResult] =WY_DsFusion(Matrix1,Matrix2)
%功能：计算两个行向量组成的新的证据体的值
%输入参数：
%Matrix1            输入向量组1且为真值概率向量组
%Matrix2            输入向量组2且为未知概率向量组
%输出参数：   
%CombinedResult     组合结果
%作者：WY
[sizeRow1 sizeCol1]=size(Matrix1);
if sizeRow1~=1
    disp('Matrix1应为行向量');
    return;
end
[sizeRow2 sizeCol2]=size(Matrix2);
if sizeRow2~=1
    disp('Matrix2应为行向量');
    return;
end
if sizeCol1~=sizeCol2
    disp('Matrix1与Matrix2的列数应该相等');
    return
end
%计算比例系数Coefficient
c1=1;
c2=1;
for i=1:1:sizeCol1
    c1=c1*Matrix1(1,i);
end
for j=1:1:sizeCol2
    c2=c2*Matrix2(1,j);
end
Coefficient=c1+c2;
%计算真值概率与未知概率
IsTrue=c1/Coefficient
UnKnown=c2/Coefficient
end

