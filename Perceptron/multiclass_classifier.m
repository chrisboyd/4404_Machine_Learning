inputs = load('irisnum.txt');
% label1 = inputs(inputs(:,5)==1,1:4);
% label2 = inputs(inputs(:,5)==2,1:4);
% label3 = inputs(inputs(:,5)==3,1:4);
dataset = inputs(:,1:4);
labels = ones(150,1);

%label1 versus label2 and label3
train = labels;
train(1:50) = -1;

%label2 versus label1 and label3
train = labels;
train(51:100) = -1;

%label3 versus label1 and label2
train = labels;
train(101:150) = -1;