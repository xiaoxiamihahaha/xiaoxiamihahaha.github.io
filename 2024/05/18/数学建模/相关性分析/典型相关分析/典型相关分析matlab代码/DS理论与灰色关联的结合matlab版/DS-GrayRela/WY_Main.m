function [] =WY_Main()
%������
%�ܵ������� ��NumOfSequense
%%1����ȡ���ݲ���ȡ��������
    NumOfSequense=99;
for col=2:1:NumOfSequense
    WY_ExchangeCol(col);
%%2�����л�ɫ��������
    DataFileName=strcat('E:\Ds-GrayRela\�м���\ExchangeCol-',num2str(col),'.mat');
    load(DataFileName);
    WY_GrayRela(Matrix);
%%3 ����������ʸ�ֵ����
    x=ans(:,2:end);
    sum=0;
    for i=1:1:NumOfSequense-1
    sum=sum+x(1,i);
    end
    gama=max(x);
    mass=gama^2/sum;
    DataFileName=strcat('E:\Ds-GrayRela\�м���\mass-',num2str(col),'.mat');
    save(DataFileName);
end
%%4 ������massֵ�ϲ���һ��
    WY_MatFileCombine();
%%5 ����δ֪����
    WY_ComputeUnknownPro();
%%6 DS���
    FileName1='E:\Ds-GrayRela\�м���\CombinedMass.mat';
    temp1=load(FileName1);
    Matrix1=temp1.CombinedMat;
    FileName2='E:\Ds-GrayRela\�м���\UnknownMatrix.mat';
    temp2=load(FileName2);
    Matrix2=temp2.UnknownMatrix;
    WY_DsFusion(Matrix1,Matrix2);
end

