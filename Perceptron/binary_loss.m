function bloss = binary_loss(weight, data, labels)
%compute total binary loss for given weight vector over all 
%inputs and respective labels
%randomizes data & label order
bloss = 0;
[rows, cols] = size(data);
data_mat = ones(rows, cols+1);
data_mat(:,1:2) = data;
data_mat(:,3) = labels;

data_mat = data_mat(randperm(size(data_mat, 1)), :);
labels = data_mat(:,3);
data_mat(:,3) = 1;

for i=1:rows
    sign = dot(weight, data_mat(i,:)) * labels(i);
    sign = sign / abs(sign);
    bloss = bloss + (.5 * sign - .5);
end

bloss = bloss / rows;

end