inputs = load('6pointsinputs.txt');
labels = load('6pointsoutputs.txt');

test_runs = 30;
weights = zeros(test_runs,3);
updates = zeros(test_runs,1);

for i=1:test_runs
    [weights(i,:),updates(i)] = perceptron(inputs,labels);
end

%test each of the weight vectors agains all inputs
%get binary loss for each of the 20 weight vectors learned
[rows,cols] = size(inputs);
data_matrix = zeros(rows,cols+1);



% 
% bloss = zeros(size(test_runs,1));
% for k=1:test_runs
%     bloss(k) = binary_loss(weights(1,:), inputs, labels); 
% end
% 
% 
% figure;
% plot([1:1:test_runs],bloss);
% hold on;
% legend('binary loss');
% title('Comparison of Binary, Hinge and Logistic Loss');
% ylabel('Loss');
% xlabel('Test run number');