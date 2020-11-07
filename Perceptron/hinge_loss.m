function hloss = hinge_loss(weight, data, labels)

hloss = max(0,1 - labels * dot(weight,data));
 

end