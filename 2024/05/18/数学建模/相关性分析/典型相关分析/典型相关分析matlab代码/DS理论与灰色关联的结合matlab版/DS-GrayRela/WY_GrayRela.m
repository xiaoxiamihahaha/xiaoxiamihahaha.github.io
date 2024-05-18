function [relevancy]=WY_GrayRela(Matrix)
%���������
% x0      �ο�������Ƚ����ӹ�ͬ�洢��һ������x0��,�ο�����λ�ڵ�һ��
%���������
% relevancy  ������
%���ߣ�WY
%б������
for i=2:length(Matrix(:,1))
    x1(i,:)=Matrix(i,:)-Matrix(i-1,:);
end
%��׼��
m=length(x1(1,:));
for i=1:m
x2(:,i)=x1(:,i)/std(x1(:,i));
end
%����
[y,pos]=sort(x2(:,1));
x2_sorted=x2(pos,:);
% �ж���������
n=length(x1(:,1));
k=[1:n]';
for j=1:m
sig_j(j)=WY_ComputeSum(k.*x2_sorted(:,j))-WY_ComputeSum(x2_sorted(:,j))*WY_ComputeSum(k)/n;
end
%caculation of distantion
for j=2:m
    dist_0i(:,j)=abs(sign(sig_j(:,j)./sig_j(:,1)).*x2_sorted(:,j)-x2_sorted(:,1));
end
%�������ϵ��
for i=1:n
    for j=1:m
        coef_rela(i,j)=(min(dist_0i)+0.5*max(dist_0i))/(dist_0i(i,j)+0.5*max(dist_0i));
    end
end
for j=1:m
relevancy(j)=WY_ComputeSum(coef_rela(:,j))/n;
end
end

