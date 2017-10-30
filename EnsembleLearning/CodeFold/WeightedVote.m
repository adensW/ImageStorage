function result = WeightedVote(label,accuracy)
%
[row,col]=size(accuracy);
[lrow,lcol]=size(label);
[jrow,jcol]=size(label{1,1});
weight=[];

%��׼�����ݸ���Ȩ��
accuracySum=0;
for i=1:col
    accuracySum= accuracySum+accuracy{1,i}(1,1);
end;
for i=1:col
    weight(1,i)=(1/accuracySum)*accuracy{1,i}(1,1);
end;
%[1,0.2222;2,0.6666;3,0.55555,]
WeightLabel=[];
markweight=0;
for j=1:jrow
    for i=1:lcol
        if label{i}(i,1)==1
            markweight=weight(1,1);
        elseif label{i}(i,1)==2
            markweight=weight(1,2);
        elseif label{i}(i,1)==3
            markweight=weight(1,3);
        elseif label{i}(i,1)==4
            markweight=weight(1,4);
        end
        WeightLabel{j,i}(1,:)=[label{i}(j,1),markweight];
    end
end
% unit test
% result = WeightLabel;
[WLrow,WLcol]=size(WeightLabel);
for i = 1:WLrow
        %��ÿһ�д�Ȩ���ݽ�����Ȩ��
        %��ȡȨ������label ��Ϊǿѧϰ����ѧϰ���label
    for j= 1:WLcol
        
        label_1=0;
        label_2=0;
        label_3=0;
        label_4=0;
        %��j�и���ǩȨ�����
        if WeightLabel{i,j}(1,1)==1
            label_1=label_1+WeightLabel{i,j}(1,2);
        elseif WeightLabel{i,j}(1,1)==2
            label_2=label_2+WeightLabel{i,j}(1,2);
        elseif WeightLabel{i,j}(1,1)==3
            label_3=label_3+WeightLabel{i,j}(1,2);
        elseif WeightLabel{i,j}(1,1)==4
            label_4=label_4+WeightLabel{i,j}(1,2);
        end
        % �ҳ����Ȩ��
        if max([label_1;label_2;label_3;label_4])==label_1
          result(i,1)=1;
        elseif max([label_1;label_2;label_3;label_4])==label_2
          result(i,1)=2;
        elseif max([label_1;label_2;label_3;label_4])==label_2
          result(i,1)=3;
        elseif max([label_1;label_2;label_3;label_4])==label_4
          result(i,1)=4;
        end
    end
    
end
       
          