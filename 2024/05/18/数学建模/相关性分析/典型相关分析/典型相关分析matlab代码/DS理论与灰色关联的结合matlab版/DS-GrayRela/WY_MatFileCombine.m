function [CombinedMat] =WY_MatFileCombine()
%将多个文件中的mass值合并到一个文件中
%输入参数：
%   无
%输出参数：
%  CombinedMat：合并后的全部mass值集合
CombinedMat=zeros(1,98);
col=1;
for NumOfMat=1:1:98   
     DataFileName=strcat('E:\Ds-GrayRela\中间结果\NoneMAs-mass-',num2str(col),'.mat');
    temp=load(DataFileName);
    CombinedMat(1,NumOfMat)= temp.mass;
    col=col+1;
end
ResultFileName='E:\Ds-GrayRela\中间结果\CombinedNoneMAsMass.mat';
save(ResultFileName);
end

