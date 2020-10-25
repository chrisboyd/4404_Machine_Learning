x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');

m = [x t];
errors = zeros(1,15);
table = array2table(m,'VariableNames',{'input','output'});
% Nonstratified partition
hpartition = cvpartition(100,'KFold',10);

%loop through each degree of polynomial for model
for w=3:15
    %loop through using each of 10 subsets as testing data, while
    %remaining 9 subsets are all used as training data
    for i=1:10
        %get a column vector, 1 indicates include row in training
        %idxTrain is the ith training set
        idxTrain = training(hpartition,i);
        %get rows identified for training from table
        tblTrain = table(idxTrain,:);
        %use remaining rows of table for test partition
        idxNew = test(hpartition,i);
        tblTest = table(idxNew,:);

        %fit polynomial
        p = polyfit(tblTrain.input,tblTrain.output,w);
        %get predicted output for training data
        pred = polyval(p, tblTest.input);
        errors(w) =  errors(w) + sum(0.5 .* (pred - tblTest.output).^2);
    end
    errors(w) = errors(w) / 10;
end
%plot average errors for each of w=[3,8] against w=[3,8]

figure;
plot([3:1:15],errors(3:15),'-*');
title('10-Fold Cross-Validation ERM Error vs Polynomial Degree');
xlabel('Degree of polynomial');
ylabel('Average Empirical Square Loss');

% plot(set1(1:10,1),set1(1:10,2),'+',x2,polyval(polyfit(set1(1:10,1),set1(1:10,2),8),x2));
% ylim([-2 2]);

% figure;
% stackedplot(set1,'*','XVariable','input');