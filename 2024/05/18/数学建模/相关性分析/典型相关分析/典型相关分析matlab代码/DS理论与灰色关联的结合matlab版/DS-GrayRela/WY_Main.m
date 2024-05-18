function [] =WY_Main()
%主函数
%总的序列数 ：NumOfSequense
%%1　读取数据并提取理想序列
    NumOfSequense=99;
for col=2:1:NumOfSequense
    WY_ExchangeCol(col);
%%2　进行灰色关联计算
    DataFileName=strcat('E:\Ds-GrayRela\中间结果\ExchangeCol-',num2str(col),'.mat');
    load(DataFileName);
    WY_GrayRela(Matrix);
%%3 计算基本概率赋值函数
    x=ans(:,2:end);
    sum=0;
    for i=1:1:NumOfSequense-1
    sum=sum+x(1,i);
    end
    gama=max(x);
    mass=gama^2/sum;
    DataFileName=strcat('E:\Ds-GrayRela\中间结果\mass-',num2str(col),'.mat');
    save(DataFileName);
end
%%4 将所有mass值合并到一起
    WY_MatFileCombine();
%%5 计算未知概率
    WY_ComputeUnknownPro();
%%6 DS组合
    FileName1='E:\Ds-GrayRela\中间结果\CombinedMass.mat';
    temp1=load(FileName1);
    Matrix1=temp1.CombinedMat;
    FileName2='E:\Ds-GrayRela\中间结果\UnknownMatrix.mat';
    temp2=load(FileName2);
    Matrix2=temp2.UnknownMatrix;
    WY_DsFusion(Matrix1,Matrix2);
end

