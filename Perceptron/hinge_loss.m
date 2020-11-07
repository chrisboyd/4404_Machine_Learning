function hloss = hinge_loss(weight, data, labels)

hloss = 0;
for i=1:size(labels)
    loss = 1 - labels(i) * dot(weight,data(i,:));
    
end

end