clear
clc
load datacope;
data=datacope;
clear datacope;
load datacopename
name=datacopename;
clear datacopename
[N,M]=size(data);
support=0.3;                     %支持度
confidence=0.5;                  %置信度

%%%%%%%%%%%%处理缺失数据%%%%%%%%%%%%%%%
for i=1:N
    for j=1:M
        if data(i,j)==9 
           data(i,j)=0;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%计算频繁-1项集frequency1%%%%%%%%%%
freq=zeros(M,1);
for i=1:M
    for j=1:N
        if data(j,i)==1
            freq(i,1)=freq(i,1)+1;
        end
    end
end
clear i j
disp('The frequent 1 itemset is :');
flag=0;
for i=1:M
    if freq(i,1)>=support*N
        flag=flag+1;
        data_f(:,flag)=data(:,i);
        disp(name(i,1))
        frequency1(flag,1)=i;
        item_1(flag,1)=i;
        item_1(flag,2)=freq(i,1);
    end
end

clear  i flag freq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%计算二项及以上频繁集%%%%%%%%%%%%%
item_num=0;
for i=1:N
    subset=generatesubset(frequency1,data_f(i,:));
    [sub_n,sub_m]=size(subset);
    max_item(i,1)=sub_m;
    if i==1
        for j=1:sub_n
            for k=1:sub_m
                if subset(j,k)~=0
                    item_num=item_num+1;
                    itemset(item_num,1)=subset(j,k);
                    itemset(item_num,2)=1;
                end
            end
        end
    end
    if i>1
        for j=1:sub_n
            for k=1:sub_m
                condition=0;
                for ii=1:item_num
                    if subset(j,k)==itemset(ii,1)
                        itemset(ii,2)=itemset(ii,2)+1;
                        break
                    else
                        condition=condition+1;
                    end
                    if condition==item_num
                        item_num=item_num+1;
                        itemset(item_num,1)=subset(j,k);
                        itemset(item_num,2)=1;
                    end
                end
            end
        end
    end
end
max_item=max(max_item);
item_num=item_num-1;
itemset=itemset(1:item_num,:);
itemset=sortrows(itemset,1);
item_change=itemset;
clear itemset
flag=0;
for i=1:item_num
    if item_change(i,2)>=support*N
        flag=flag+1;
        itemset(flag,1)=item_change(i,1);
        itemset(flag,2)=item_change(i,2);
    end
end
item_num=flag;
clear sub_n sub_m subset i j k ii  condition item_change flag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
