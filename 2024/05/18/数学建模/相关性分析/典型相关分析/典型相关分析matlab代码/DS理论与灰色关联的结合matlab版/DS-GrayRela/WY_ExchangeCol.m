function[NewMatrix]=WY_ExchangeCol(col)
%交换所需列数
%输入参数：col         需要交换的列数
%输出参数：NewMatrix   交换后的矩阵
%作者：WY
Matrix=xlsread('E:\Ds-GrayRela\特征值.xlsx');
[r,c]=size(Matrix);
temp=zeros(c,1);
for i=1:1:r
     temp(i,1)=Matrix(i,1);
       Matrix(i,1)=Matrix(i,col);
       Matrix(i,col)=temp(i,1);
end
Name=strcat('E:\Ds-GrayRela\中间结果\ExchangeCol-',num2str(col),'.mat');
save(Name);
end

