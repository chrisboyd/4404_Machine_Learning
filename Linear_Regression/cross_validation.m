x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');

m = [x t];

table = array2table(m,'VariableNames',{'input','output'});
% Nonstratified partition
hpartition = cvpartition(100,'Holdout',0.1); 
%get a column vector, 1 indicates include row in training
idxTrain = training(hpartition);
%get rows identified for training from table
tblTrain = table(idxTrain,:);
%use remaining rows of table for test partition
idxNew = test(hpartition);
tblNew = table(idxNew,:);

%for each set of 10 training points, train a model of
%W=1..10 
set1 = table2array(tblTrain);
x2 = [-1:.1:1];


% plot(set1(1:10,1),set1(1:10,2),'+',x2,polyval(polyfit(set1(1:10,1),set1(1:10,2),8),x2));
% ylim([-2 2]);

% figure;
% stackedplot(set1,'*','XVariable','input');