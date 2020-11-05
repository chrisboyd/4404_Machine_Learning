input = load('6pointsinputs.txt');
output = load('6pointsoutputs.txt');
full = input;
full(:,3) = output;
positive = full(full(:,3)==1,:);
negative = full(full(:,3)==-1,:);

figure;
plot(positive(:,1),positive(:,2) ,'+');
hold on;
plot(negative(:,1),negative(:,2) ,'o');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
legend('Positive Classification', 'Negative Classification');
title('Plot of Input Vectors and Expected Classification');
xlim([-3,3]);
ylim([-3,3]);

weights = zeros(6,3);
iterations = zeros(6,1);

for i=1:6
    [weights(i,:), iterations(i)] = test(input,output);
end


function [weights, iterations] = test(input, labels)
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
    
    if sign == 0;
        weights = weights + labels(iterations) * des_matr(iterations,:);
    else (sign * labels(iterations) > 0);
        error = 0;
    end
    
end


end