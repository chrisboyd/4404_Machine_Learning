% inputs = load('6pointsinputs.txt');
% labels = load('6pointsoutputs.txt');
inputs = load('fg_inputs.txt');
labels = load('fg_outputs.txt');
[rows, cols] = size(inputs);
data_matrix = zeros(rows, cols+1);

test_runs = 20;
weights = zeros(test_runs, cols+1);
bloss = zeros(1, test_runs);
hloss = zeros(1, test_runs);
logloss = zeros(1, test_runs);
for i=1:test_runs
    %randomize order of inputs and respective labels
    data_matrix(:,1:cols) = inputs;
    data_matrix(:,end) = labels;
    data_matrix = data_matrix(randperm(size(data_matrix, 1)), :);
    data_labels = data_matrix(:,end);
    data_matrix(:,end) = 1;
    
    %train the perceptron
    weights(i,:) = perceptron(data_matrix,data_labels);
    bloss(i) = binary_loss(weights(i,:),data_matrix,data_labels);
    %randomly select a point from data_matrix and data_labels to find 
    %hinge error for
    hpoint = randi(rows);
    hloss(i) = hinge_loss(weights(i,:),data_matrix(hpoint,:),data_labels(hpoint,:));
    logloss(i) = logistic_loss(weights(i,:),data_matrix,data_labels);
end
%get minimum loss weight vector for each type of loss
[b_min, b_i] = max(bloss)
weights(b_i,:)
[h_min, h_i] = min(hloss)
weights(h_i,:)
[l_min, l_i] = min(logloss)
weights(l_i,:)

figure;
plot([1:1:test_runs],bloss,'r');
hold on;
plot([1:1:test_runs],hloss,'b');
plot([1:1:test_runs],logloss,'g');
legend('binary loss','hinge loss (random data point)','logistic loss');
title('Comparison of Binary, Hinge and Logistic Loss');
ylabel('Loss');
xlabel('Test run number');
%ylim([-0.05,1]);