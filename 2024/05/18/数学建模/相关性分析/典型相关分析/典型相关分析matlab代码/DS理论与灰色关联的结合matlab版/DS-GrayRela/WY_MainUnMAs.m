function [] =WY_MainUnMAs()
%������
%�ܵ������� ��NumOfSequense
%%1����ȡ���ݲ���ȡ��������
    Compare=xlsread('E:\Ds-GrayRela\����ֵ.xlsx');
    load('E:\DS-GrayRela\�м���\image1_training-10-ImageFeatureSelect.mat');
    for num=1:1:98
        Conference=NoneMAs(:,num);
%%2�����л�ɫ��������
        Matrix=[Conference Compare];
        WY_GrayRela(Matrix);
%%3 ����������ʸ�ֵ����
        x=ans(:,2:end);
        sum=0;
        for i=1:1:98
        sum=sum+x(1,i);
        end
        gama=max(x);
        mass=gama^2/sum;
        DataFileName=strcat('E:\Ds-GrayRela\�м���\NoneMAs-mass-',num2str(num),'.mat');
        save(DataFileName);
    end
%%4 ������massֵ�ϲ���һ��
    WY_MatFileCombine();
%%5 DS���
    FileName1='E:\Ds-GrayRela\�м���\CombinedMass.mat';
    temp1=load(FileName1);
    Matrix1=temp1.CombinedMat;
    FileName2='E:\Ds-GrayRela\�м���\CombinedNoneMAsMass.mat';
    temp2=load(FileName2);
    Matrix2=temp2.CombinedMat;
    WY_DsFusion(Matrix1,Matrix2);
end