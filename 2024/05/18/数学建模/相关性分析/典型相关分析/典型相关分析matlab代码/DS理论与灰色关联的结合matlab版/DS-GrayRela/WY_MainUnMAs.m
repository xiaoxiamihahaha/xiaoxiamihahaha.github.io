function [] =WY_MainUnMAs()
%主函数
%总的序列数 ：NumOfSequense
%%1　读取数据并提取理想序列
    Compare=xlsread('E:\Ds-GrayRela\特征值.xlsx');
    load('E:\DS-GrayRela\中间结果\image1_training-10-ImageFeatureSelect.mat');
    for num=1:1:98
        Conference=NoneMAs(:,num);
%%2　进行灰色关联计算
        Matrix=[Conference Compare];
        WY_GrayRela(Matrix);
%%3 计算基本概率赋值函数
        x=ans(:,2:end);
        sum=0;
        for i=1:1:98
        sum=sum+x(1,i);
        end
        gama=max(x);
        mass=gama^2/sum;
        DataFileName=strcat('E:\Ds-GrayRela\中间结果\NoneMAs-mass-',num2str(num),'.mat');
        save(DataFileName);
    end
%%4 将所有mass值合并到一起
    WY_MatFileCombine();
%%5 DS组合
    FileName1='E:\Ds-GrayRela\中间结果\CombinedMass.mat';
    temp1=load(FileName1);
    Matrix1=temp1.CombinedMat;
    FileName2='E:\Ds-GrayRela\中间结果\CombinedNoneMAsMass.mat';
    temp2=load(FileName2);
    Matrix2=temp2.CombinedMat;
    WY_DsFusion(Matrix1,Matrix2);
end