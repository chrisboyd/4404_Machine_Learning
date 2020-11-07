function hloss = hinge_loss(weight, data, labels)
%hinge loss = max(0, 1 - t<w,x>)
hloss = max(0,1 - labels * dot(weight,data));

end