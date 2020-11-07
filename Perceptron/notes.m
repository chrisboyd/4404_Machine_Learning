[rows, cols] = size(input);
des_matr = zeros(rows, cols+1);
des_matr(:,1:2) = input;
des_matr(:,3) = labels;
des_matr = des_matr(randperm(size(des_matr, 1)), :);
labels_reorder = des_matr(:,3);
des_matr(:,3) = 1;
weights = zeros(1, cols+1);


iterations = 0;
error = -1;

while error ~= 0 && iterations <= 100
    i = 1;
    while i<=6
        sign = dot(weights, des_matr(i,:));
        if sign == 0
            weights = weights + labels_reorder(i) * des_matr(i,:);
            iterations = iterations + 1;
        elseif (sign * labels_reorder(i) > 0)
            error = 0;
        end
        i=i+1;
    end

end

weights = weights ./ norm(weights);

end