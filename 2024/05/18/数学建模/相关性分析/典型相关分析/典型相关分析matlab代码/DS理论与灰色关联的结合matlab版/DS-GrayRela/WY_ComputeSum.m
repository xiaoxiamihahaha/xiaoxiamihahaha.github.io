function [output]=WY_ComputeSum(input)
%输入参数：
%input   输入矩阵
%output  输出参数
%作者：WY
output=0;
for i=1:length(input)
    output=output+input(i);
end
