function[NewMatrix]=WY_ExchangeCol(col)
%������������
%���������col         ��Ҫ����������
%���������NewMatrix   ������ľ���
%���ߣ�WY
Matrix=xlsread('E:\Ds-GrayRela\����ֵ.xlsx');
[r,c]=size(Matrix);
temp=zeros(c,1);
for i=1:1:r
     temp(i,1)=Matrix(i,1);
       Matrix(i,1)=Matrix(i,col);
       Matrix(i,col)=temp(i,1);
end
Name=strcat('E:\Ds-GrayRela\�м���\ExchangeCol-',num2str(col),'.mat');
save(Name);
end

