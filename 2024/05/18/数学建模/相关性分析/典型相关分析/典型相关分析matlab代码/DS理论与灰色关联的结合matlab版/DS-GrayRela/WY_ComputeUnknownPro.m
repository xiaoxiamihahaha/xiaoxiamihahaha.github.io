function [UnknownMatrix] =WY_ComputeUnknownPro()
%����δ֪����
%���������
%   ��
%���������
%   UnknownMatrix ��δ֪���ʾ���
UnknownMatrix=zeros(1,98);
col=2;
for NumOfMat=2:1:99   
    DataFileName=strcat('E:\Ds-GrayRela\�м���\mass-',num2str(col),'.mat');
    temp=load(DataFileName);
    UnknownMatrix(1,NumOfMat-1)=1-temp.gama;
    col=col+1;
end
ResultFileName='E:\Ds-GrayRela\�м���\UnknownMatrix.mat';
save(ResultFileName);
end

