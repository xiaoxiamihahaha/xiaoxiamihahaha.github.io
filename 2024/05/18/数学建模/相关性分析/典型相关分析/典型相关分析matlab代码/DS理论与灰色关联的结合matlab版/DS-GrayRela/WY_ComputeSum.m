function [output]=WY_ComputeSum(input)
%���������
%input   �������
%output  �������
%���ߣ�WY
output=0;
for i=1:length(input)
    output=output+input(i);
end
