function rate = FailRate(PredictLabel,TestLabel)
[row,col]=size(PredictLabel);
count=0;
total=row;
for i=1:row
    if PredictLabel(i,1)~=TestLabel(i,1)
        count=count+1;
    end
end
rate=count/total;