function [weights, iterations] = perceptron(input, labels)
[rows, cols] = size(input);
des_matr = zeros(rows, cols+1);
des_matr(:,1:2) = input;
des_matr(:,3) = labels;
des_matr = des_matr(randperm(size(des_matr, 1)), :);
labels = des_matr(:,3);
des_matr(:,3) = 1;
weights = zeros(1, cols+1);


iterations = 0;
error = -1;

while error ~= 0 && iterations <= 6
    iterations = iterations + 1;
    sign = dot(weights, des_matr(iterations,:));
    
    if sign == 0
        weights = weights + labels(iterations) * des_matr(iterations,:);
        
    elseif (sign * labels(iterations) > 0)
        error = 0;
    end
    
end

weights = weights ./ norm(weights);
%pause;
end