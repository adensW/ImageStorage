clear;
load('busData.mat');
load('opelData.mat');
load('saabData.mat');
load('vanData.mat');
T = 10;
for i=1:T
    [ResultD,ResultL,TestData,TestLabel] = SamplingWithReplacement(busData,opelData,saabData,vanData,T);
    D{i}=ResultD;
    Label{i}=ResultL;
    TD{i}=TestData;
    TL{i}=TestLabel;
end

ttd=[TD{1};TD{2};TD{3};TD{4};TD{5};TD{6};TD{7};TD{8};TD{9};TD{10}];
ttl=[TL{1};TL{2};TL{3};TL{4};TL{5};TL{6};TL{7};TL{8};TL{9};TL{10}];
% libsvmwrite('D:\softwave\workplaces\StadyMechien\data.txt', ttl, ttd);
% [ttl,ttd]=libsvmread('D:\softwave\workplaces\StadyMechien\data.txt');
% model = svmtrain(training_label_vector, training_instance_matrix [, 'libsvm_options']);
t1= clock;
for i=1:T
    
    tic
    h{i} = svmtrain(Label{i},D{i},'-s 1 -t 2');%-s(,1
%     [predict_label{i}, accuracy{i}, dec_values{i}] = svmpredict(TestLabel, TestData, h{i});
%     [predict_label{i}, accuracy{i}, dec_values{i}] = svmpredict(TL{i}, TD{i}, h{i});
    [predict_label{i}, accuracy{i}, dec_values{i}] = svmpredict(ttl, ttd, h{i});
    fprintf('D%2d¥ÌŒÛ¬ £∫%.2f%%.\n',i, 100-accuracy{i}(1));
    toc
end
%º∆À„Hoob
Hoobx=calcHoobx(predict_label,ttl);
eoob=calceoob(Hoobx,ttl)
label = WeightedVote(predict_label,accuracy);
% label= vote(predict_label);
% rate=FailRate(label,ttl)
t2=clock;
Hxtime = etime(t2,t1)
