clear
datacope=xlsread('05 COPD总体106变量20080712.xls','变量分有无数据库','g2:l1554');
save datacope;
clear datacope;

[numeric,datacopename]=xlsread('05 COPD总体106变量20080712.xls','变量名称代码','b8:b13');
clear numeric
save datacopename;
clear datacopename;
