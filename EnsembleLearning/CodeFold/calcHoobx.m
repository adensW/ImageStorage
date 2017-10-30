function Hoobx = calcHoobx(label,testlabel)
[row,col]=size(label);
[jrow,jcol]=size(label{1});
HoobxCount = 0;
max=0;

for i=1:col
    for j=1:jrow  
        if label{i}(j,1)==testlabel(j,1)
            HoobxCount =HoobxCount+1;
        end
    end
    if HoobxCount>max
         max=HoobxCount;
         Hoobx=label{i}; 
    end
    HoobxCount=0;
end