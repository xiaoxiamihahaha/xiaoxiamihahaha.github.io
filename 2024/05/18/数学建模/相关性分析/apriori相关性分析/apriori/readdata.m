clear
datacope=xlsread('05 COPD����106����20080712.xls','�������������ݿ�','g2:l1554');
save datacope;
clear datacope;

[numeric,datacopename]=xlsread('05 COPD����106����20080712.xls','�������ƴ���','b8:b13');
clear numeric
save datacopename;
clear datacopename;
