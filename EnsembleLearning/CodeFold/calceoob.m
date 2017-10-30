function eoob= calceoob(Hoobx,testlabel)
[row,col]=size(Hoobx);
eoobCount=0;
for i=1:row
    if Hoobx(i,1)~=testlabel(i,1)
        eoobCount=eoobCount+1;
    end
end
eoob=eoobCount/row;