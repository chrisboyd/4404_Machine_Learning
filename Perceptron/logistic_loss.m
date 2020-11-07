function logloss = logistic_loss(weight, data, labels)
%logistic loss is average hinge loss over all data points
logloss = 0;
for i=1:size(labels)
    loss = 1 - labels(i) * dot(weight, data(i,:));
    loss = max(0, loss);
    logloss = logloss + loss;
end
logloss = logloss / i;
end