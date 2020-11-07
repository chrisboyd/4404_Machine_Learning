inputs = load('6pointsinputs.txt');
labels = load('6pointsoutputs.txt');
[rows, cols] = size(inputs);
data_matrix = zeros(rows, cols+1);

test_runs = 20;
weights = zeros(test_runs,cols+1);
bloss = zeros(1, test_runs);
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
end

figure;
plot([1:1:test_runs],bloss);
hold on;
legend('binary loss');
title('Comparison of Binary, Hinge and Logistic Loss');
ylabel('Loss');
xlabel('Test run number');