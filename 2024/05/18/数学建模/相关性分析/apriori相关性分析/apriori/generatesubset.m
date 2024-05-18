function itemset=generatesubset(frequency1,data)
M=length(data);
flag=0;
for j=1:M
    if data(1,j)~=0
        flag=flag+1;
        index(1,flag)=frequency1(j,1);
    end
end

if flag<=1
    itemset=0;
else
    for k=2:flag
        for i=1:k
            flag_a=0;
            flag_b=0;
            for j=1:flag
                if i==1
                    flag_a=flag_a+1;
                    item(flag_a,1)=index(1,flag_a)*10^(k-i);
                    itm(flag_a,1)=index(1,flag_a);
                    leng(i)=length(itm(:,i));
                end
                if i>1
                    flag_a=flag_a+1;
                    for m=1:leng(i-1)
                        if index(1,flag_a)>it(m,1)
                            flag_b=flag_b+1;
                            item(flag_b,i)=item(m,i-1)+index(1,flag_a)*10^(k-i);
                            itm(flag_b,1)=index(1,flag_a);
                            leng(i,1)=length(itm(:,1));
                        end
                    end
                end
            end
            it=itm;
            clear itm
        end
        itemset(1:leng(i,1),k-1)=item(1:leng(i,1),k);
        clear item
    end
end
itemset=itemset;

% for k=2:flag
%     flag_b=0;
%     for i=1:k
%         flag_a=0;
%         for j=1:flag
%             if i==1
%                 flag_a=flag_a+1;
%                 ite(flag_a,1)=index(1,j);
%                 itm(flag_a,i)=ite(flag_a,1);
%                 len(1,1)=0;
%                 flag_b=flag_b+1;
%                 item(flag_b,1)=ite(flag_a,1)*10^(k-i);
%                 ittt=itm;
%             end
%             if i>1
%                 flag_a=flag_a+1;
%                 ite(flag_a,1)=index(1,j);
%                 itm(flag_a,i)=it(j,1);
%                 len_a=0;
%                 for ii=1:length(item(:,i-1))
%                     if item(ii,i-1)~=0
%                         len_a=len_a+1;
%                     end
%                 end
%                 len(i,1)=len(i-1,1)+len_a;
%                 flag_d=0;
%                 for ii=1:length(item(:,i-1))
%                     if item(ii,i-1)~=0
%                         flag_d=flag_d+1;
%                     end
%                 end
%                 for m=1:flag_d
%                     if ite(flag_a,1)>it(m,1)
%                         flag_b=flag_b+1;
%                         item(flag_b,i)=item(len(i-1)+m,i-1)+ite(flag_a,1)*10^(k-i);
%                         ittt(flag_b-flag_d,1)=ite(flag_a,1);
%                     end
%                 end 
%             %    clear m
%             end
%         end
%         flag_f=0;
%         for ii=1:length(ittt(:,1))
%             if ittt(ii,1)~=0
%                 flag_f=flag_f+1;
%                 itt(flag_f,1)=ittt(ii,1);
%             end
%         end
%         it=itt;
%     end
%     flag_e=0;
%     for ii=1:length(item(:,k))
%         if item(ii,k)~=0
%             flag_e=flag_e+1;
%         end
%     end
%     itemset(1:flag_e,k-1)=item(len(k)+1:flag_b,k);
%     clear item ite itm i j len flag_a flag_b flag_d flag_e ii itt ittt
% end
