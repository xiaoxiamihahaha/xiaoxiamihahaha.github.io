function [CombinedMat] =WY_MatFileCombine()
%������ļ��е�massֵ�ϲ���һ���ļ���
%���������
%   ��
%���������
%  CombinedMat���ϲ����ȫ��massֵ����
CombinedMat=zeros(1,98);
col=1;
for NumOfMat=1:1:98   
     DataFileName=strcat('E:\Ds-GrayRela\�м���\NoneMAs-mass-',num2str(col),'.mat');
    temp=load(DataFileName);
    CombinedMat(1,NumOfMat)= temp.mass;
    col=col+1;
end
ResultFileName='E:\Ds-GrayRela\�м���\CombinedNoneMAsMass.mat';
save(ResultFileName);
end

