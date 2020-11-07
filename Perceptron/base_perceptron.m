inputs = load('6pointsinputs.txt');
labels = load('6pointsoutputs.txt');

for j=1:100
    num_updates = prove_perceptron(inputs,labels);
    if num_updates ~= 1
        fprintf('WARNING: more than one update for weight vector\n');
    end
end

function num_updates = prove_perceptron(inputs,labels)
    [rows, cols] = size(inputs);
    %randomize order of inputs and respective labels
    des_matr = zeros(rows, cols+1);
    des_matr(:,1:2) = inputs;
    des_matr(:,3) = labels;
    des_matr = des_matr(randperm(size(des_matr, 1)), :);
    inputs = des_matr(:,1:2);
    labels = des_matr(:,3);
    updates = 0;
    errors = -1;
    weight = zeros(1,2);
    j = 1;
    while j<=100 && errors == -1
        %assume no more training required
        errors = 0;
        for i=1:6
            sign = labels(i) * dot(weight, inputs(i,:));
            if sign <= 0
                weight = weight + labels(i) * inputs(i,:);
                updates = updates + 1;
                %more training is required
                errors = -1;
            end
        end
        j = j+1;  
    end
    num_updates = updates;
end