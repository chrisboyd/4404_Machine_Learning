input = load("data_banknote_authentication.txt");
data = input;
data(:,5) = 1;
labels = input(:,5);
labels(labels(:)==0) = -1;

theta = zeros(1,5);
w = zeros(1,5);
T = 500;
lambda = .001;
i = 1;
b_loss = zeros(1,T);
h_loss = zeros(1,T);
for j = 1:T
    w = (1/lambda * j) * theta;
    i = ceil(rand * numel(labels));
    error = labels(i) * dot(w, data(i,:));
    if error < 1
        theta = theta + labels(i) * data(i,:);
    else
        theta = theta;
    end
    b_loss(j) = binary_loss(w,data,labels);
    h_loss(j) = logistic_loss(w,data,labels);
end

figure;
x = 1:1:500;
plot(x,b_loss);
title('Binary Loss of SGD for SoftSVM for lambda = .001');
xlabel('iteration');
ylabel('loss');
figure;
plot(x,h_loss);
title('Hinge Loss of SGD for SoftSVM for lambda = .001');
xlabel('iteration');
ylabel('loss');
