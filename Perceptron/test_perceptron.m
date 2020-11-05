input = load('6pointsinputs.txt');
label = load('6pointsoutputs.txt');

weights = zeros(6,3);
iterations = zeros(6,1);

for i=1:6
    [weights(i,:), iterations(i)] = perceptron(input,label);
end

%test each of the weight vectors agains all inputs
for j=1:6
    if (iterations(j) ~= 2)
        fprintf('ERROR, more than one update for weights(%f)\n',j);
    end
    for s=1:6
        sign = dot(weights(j,1:2),input(s,:));
        if (sign * label(s) <= 0)
            fprintf('ERROR, weights(%f) on input(%f)\n',j,s);
        end
    end
    
end