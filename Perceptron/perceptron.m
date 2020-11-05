input = load('6pointsinputs.txt');
output = load('6pointsoutputs.txt');

weights = test(input,output);


function [weights, iterations] = test(input, labels)
[rows, cols] = size(input);
des_matr = zeros(rows, cols+1);
des_matr(:,1:2) = input;
des_matr(:,3) = labels;
des_matr = des_matr(randperm(size(des_matr, 1)), :);
labels = des_matr(:,3);
des_matr(:,3) = 1;
weights = zeros(1, cols+1);


iterations = 1;
error = -1;

while error ~= 0 || iterations > 6
    sign = dot(weights, shuffle_in(1,1:2));
    iterations = iterations + 1;
    if (sign * 
    
end


pause;
end