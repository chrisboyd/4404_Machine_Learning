function [weight, updates] = perceptron(inputs, labels)
    [rows, cols] = size(inputs);
    %randomize order of inputs and respective labels
    data_matrix = zeros(rows, cols+1);
    data_matrix(:,1:2) = inputs;
    data_matrix(:,3) = labels;
    data_matrix = data_matrix(randperm(size(data_matrix, 1)), :);
    labels = data_matrix(:,3);
    data_matrix(:,3) = 1;
    
    updates = 0;
    error = -1;
    weight = zeros(1,cols+1);
    j = 1;
    while j<=100 && error == -1
        %assume no more training required
        error = 0;
        for i=1:6
            sign = labels(i) * dot(weight, data_matrix(i,:));
            if sign <= 0
                weight = weight + labels(i) * data_matrix(i,:);
                updates = updates + 1;
                %more training is required
                error = -1;
            end
        end
        j = j+1;  
    end
    weight = weight ./ norm(weight);
end
