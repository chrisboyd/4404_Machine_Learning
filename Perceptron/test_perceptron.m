inputs = load('6pointsinputs.txt');
labels = load('6pointsoutputs.txt');

weights = zeros(6,3);
iterations = zeros(6,1);

test_runs = 30;

for i=1:test_runs
    [weights(i,:), iterations(i)] = perceptron(inputs,labels);
end

%test each of the weight vectors agains all inputs
for j=1:test_runs
    if (iterations(j) ~= 2)
        fprintf('WARNING: more than one update for weight vector\n');
    end
    for s=1:6
        sign = dot(weights(j,1:2),inputs(s,:));
        if (sign * labels(s) <= 0)
            fprintf('ERROR: weights(%f) on input(%f)\n',j,s);
        end
    end
    
end

%get binary loss for each of the 20 weight vectors learned
bloss = zeros(size(test_runs,1));
for i=i:test_runs
    bloss(i) = binary_loss(weights(i,:), inputs, labels); 
end
figure;
plot([1:1:test_runs],bloss);
hold on;
legend('binary loss');
title('Comparison of Binary, Hinge and Logistic Loss');
ylabel('Loss');
xlabel('Test run number');