function bloss = binary_loss(weight, data, labels)
%compute total binary loss for given weight vector over all 
%inputs and respective labels

bloss = 0;
[rows, cols] = size(data);
data_mat = ones(rows, cols+1);
data_mat(:,1:2) = data;

for i=1:rows
    sign = dot(weight, data_mat(i,:)) * labels(i);
    sign = sign / abs(sign);
    bloss = bloss + (.5 * sign - .5);
end

bloss = bloss / rows;

end