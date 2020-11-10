function weight = perceptron(inputs, labels)
[rows,cols] = size(inputs);
updates = 0;
error = -1;
weight = zeros(1,cols);
j = 1;
while j<=100 && error == -1
    %assume no more training required
    error = 0;
    for i=1:rows
        sign = labels(i) * dot(weight, inputs(i,:));
        if sign <= 0
            weight = weight + labels(i) * inputs(i,:);
            updates = updates + 1;
            %more training is required
            error = -1;
        end
    end
    j = j+1;  
end
weight = weight ./ norm(weight);
end
