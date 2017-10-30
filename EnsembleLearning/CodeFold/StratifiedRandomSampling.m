function [D,outputD,testdata] = StratifiedRandomSampling(data1,data2,data3,data4,length)
[row1,col1]=size(data1);
[row2,col2]=size(data2);
[row3,col3]=size(data3);
[row4,col4]=size(data4);
data = [data1;data2;data3;data4];
testdata=[data1;data2;data3;data4];
num1 = floor(row1/length);
num2 = floor(row2/length);
num3 = floor(row3/length);
num4 = floor(row4/length);
% 1 bus 
% 2 opel
% 3 saab
% 4 van
    
    for i = 1:num1
        R=unidrnd(row1);
        Result(i,:)=data1(R,:);
        output(i,1)=1;
        testdata(R,:)=zeros(1,18);
    end

    for i = 1:num2
        R=unidrnd(row2);
        Result(i+num1,:)=data2(R,:);
        output(i+num1,1)=2;
        testdata(R+row1,:)=zeros(1,18);
    %     output(i+num1,19)=-1;
    end
    for i = 1:num3
        R=unidrnd(row3);
        Result(i+num1+num2,:)=data3(R,:);
        output(i+num1+num2,1)=3;
        testdata(R+row1+row2,:)=zeros(1,18);
    %     output(i+num1+num2,19)=-1;
    end
    for i = 1:num4
        R=unidrnd(row4);
        Result(i+num1+num2+num3,:)=data4(R,:);
        output(i+num1+num2+num3,1)=4;
        testdata(R+row1+row2+row3,:)=zeros(1,18);
    %     output(i+num1+num2+num3,19)=-1;
    end
D = Result;
outputD=output;
[trow,tcol]=size(testdata);
mark=0;
for i=1:trow
    if(testdata(i-mark,1)==0&testdata(i-mark,2)==0)
        testdata(i-mark,:)=[];
        mark = mark+1;
    end
end

% for i =1:num1
%     output(i,19)=-1;
% end
% for i =1:num2
%     output(i+num1,19)=-2;
% end
% for i =1:num3
%     output(i+num1+num2,19)=-3;
% end
% for i =1:num4
%     output(i+num1+num2+num3,19)=-4;
% end
