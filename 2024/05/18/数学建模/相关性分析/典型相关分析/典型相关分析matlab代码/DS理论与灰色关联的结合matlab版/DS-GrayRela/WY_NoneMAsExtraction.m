function [NoneMAs] = WY_NoneMAsExtraction(numOfImgFrom,numOfImgTo)
%提取非瘤特征值
%输入参数：
% numOfImg:  图像编号
%输出参数；
% NoneMAs：  非瘤特征值矩阵
%作者：WY
for numOfImg= numOfImgFrom:1: numOfImgTo
ImageName=strcat('image',num2str(numOfImg),'_training');
DataFileName=strcat('E:\feature\',ImageName,'-9-ImageFeatureValue.mat');
load(DataFileName);
NoneMAs=zeros(34,size(Img.Area,2));
NoneMAs(1,:)=Img.Area;
NoneMAs(2,:)=Img.Perimeter;
NoneMAs(3,:)=Img.Major;
NoneMAs(4,:)=Img.Minor;
NoneMAs(5,:)=Img.MajorVSMinor;
NoneMAs(6,:)=Img.Eccentricity;
NoneMAs(7,:)=Img.Circularity;
NoneMAs(8,:)=Img.IGreenMean;
NoneMAs(9,:)=Img.NormGreen;
NoneMAs(10,:)=Img.IGreenMax;
NoneMAs(11,:)=Img.IscMean;
NoneMAs(12,:)=Img.NormIsc;
NoneMAs(13,:)=Img.IscMax;
NoneMAs(14,:)=Img.IMatched1Max;
NoneMAs(15,:)=Img.IRedContrast;
NoneMAs(16,:)=Img.IGreenContrast;
NoneMAs(17,:)=Img.IBlueContrast;
NoneMAs(18,:)=Img.IHueContrast;
NoneMAs(19,:)=Img.IGreenGF1;
NoneMAs(20,:)=Img.IGreenGF2;
NoneMAs(21,:)=Img.IGreenGF4;
NoneMAs(22,:)=Img.IGreenGF8;
NoneMAs(23,:)=Img.IGreenGFStd1;
NoneMAs(24,:)=Img.IGreenGFStd2;
NoneMAs(25,:)=Img.IGreenGFStd4;
NoneMAs(26,:)=Img.IGreenGFStd8;
NoneMAs(27,:)=Img.CORMax;
NoneMAs(28,:)=Img.CORMin;
NoneMAs(29,:)=Img.CORMean;
NoneMAs(30,:)=Img.SSEMax;
NoneMAs(31,:)=Img.SSEMin;
NoneMAs(32,:)=Img.SSEMean;
NoneMAs(33,:)=Img.Solidity;
NoneMAs(34,:)=Img.Extent;
ResultFileName=strcat('E:\DS-GrayRela\中间结果\',ImageName,'-10-ImageFeatureSelect.mat');
save(ResultFileName);
end
end

