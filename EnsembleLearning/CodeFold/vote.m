function result = vote(label)
[lrow,lcol]=size(label);
[jrow,jcol]=size(label{1,1});
label_1=0;
label_2=0;
label_3=0;
label_4=0;
result=[];
%统计
for j=1:jrow
    for i = 1:lrow
        if label{i}(j,1)==1
            label_1=label_1+1;
        end
        if label{i}(j,1)==2
            label_2=label_2+1;
        end
        if label{i}(j,1)==3
            label_3=label_3+1;
        end
        if label{i}(j,1)==4
            label_4=label_4+1;
        end
    end
    %得出投票结果
    if max([label_1,label_2,label_3,label_4])==label_1
        result(j,1)=1;
    
    elseif max([label_1,label_2,label_3,label_4])==label_2
        result(j,1)=2;
   
    elseif max([label_1,label_2,label_3,label_4])==label_3
        result(j,1)=3;
    
    elseif max([label_1,label_2,label_3,label_4])==label_4
        result(j,1)=4;
    end
end
