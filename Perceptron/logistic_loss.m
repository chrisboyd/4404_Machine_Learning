function logloss = logistic_loss(weight, data, labels)
logloss = 0;

for i=1:size(labels)
    loss = 1 - labels(i) * dot(weight, data(i,:));
    loss = max(0, loss);
    logloss = logloss + loss;
end

logloss = logloss / i;
end