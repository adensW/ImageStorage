function [DWithLabel,label,TestData,TestLabel]=SamplingWithReplacement(data1,data2,data3,data4,T)
[row1,col1]=size(data1);
[row2,col2]=size(data2);
[row3,col3]=size(data3);
[row4,col4]=size(data4);
data = [data1;data2;data3;data4];
[row,col]=size(data);

for i=1:row1
    label(i,1)=1;
end
for i=1:row2
    label(i+row1,1)=2;
end
for i=1:row3
    label(i+row1+row2,1)=3;
end
for i=1:row4
    label(i+row1+row2+row3,1)=4;
end

DataWithLabel = [data,label];
TestDataWithLabel = DataWithLabel;
% 1 bus 
% 2 opel
% 3 saab
% 4 van  
DWithLabel=[];
for j=1:row
    r =unidrnd(row);%获取抽样的值
    DWithLabel(j,:)=DataWithLabel(r,:);
    TestDataWithLabel(r,:)= zeros(1,19);
end
mark=0;
for i=1:row
    if(TestDataWithLabel(i-mark,1)==0&TestDataWithLabel(i-mark,2)==0)
        TestDataWithLabel(i-mark,:)=[];
        mark = mark+1;
    end
end
for i=1:col
    D(:,i)=DWithLabel(:,i);
    TestData(:,i) = TestDataWithLabel(:,i);
end
label(:,1) = DWithLabel(:,19);
TestLabel(:,1)=TestDataWithLabel(:,19);
