function [UnknownMatrix] =WY_ComputeUnknownPro()
%计算未知概率
%输入参数：
%   无
%输出参数：
%   UnknownMatrix ；未知概率矩阵
UnknownMatrix=zeros(1,98);
col=2;
for NumOfMat=2:1:99   
    DataFileName=strcat('E:\Ds-GrayRela\中间结果\mass-',num2str(col),'.mat');
    temp=load(DataFileName);
    UnknownMatrix(1,NumOfMat-1)=1-temp.gama;
    col=col+1;
end
ResultFileName='E:\Ds-GrayRela\中间结果\UnknownMatrix.mat';
save(ResultFileName);
end

