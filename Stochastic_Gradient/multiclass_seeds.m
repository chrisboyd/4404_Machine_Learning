input = load("seeds_dataset.txt");
%data_labels(data_labels(:,end)==1) = -1;

%w1
data_w1 = input;
data_w1(:,end) = 1;
labels_w1 = input(:,end);
labels_w1(labels_w1(:,end)==2) = -1;
labels_w1(labels_w1(:,end)==3) = -1;
w1 = perceptron(data_w1,labels_w1);
loss_w1 = binary_loss(w1,data_w1,labels_w1);

%w2
data_w2 = input;
data_w2(:,end) = 1;
labels_w2 = input(:,end);
labels_w2(labels_w2(:,end)==1) = -1;
labels_w2(labels_w2(:,end)==2) = 1;
labels_w2(labels_w2(:,end)==3) = -1;
w2 = perceptron(data_w2,labels_w2);
loss_w2 = binary_loss(w2,data_w2,labels_w2);

%w3
data_w3 = input;
data_w3(:,end) = 1;
labels_w3 = input(:,end);
labels_w3(labels_w3(:,end)==1) = -1;
labels_w3(labels_w3(:,end)==2) = -1;
labels_w3(labels_w3(:,end)==3) = 1;
w3 = perceptron(data_w3,labels_w3);
loss_w3 = binary_loss(w3,data_w3,labels_w3);
b_loss = 0;
%perform multi-class using argmax of three weight vectors
for i = 1:numel(labels_w1)
    test = input(i,:);
    test(end) = 1;
    y = [dot(w1,test) dot(w2,test) dot(w3,test)];
    [m,class] = max(y);
    if class ~= input(i,end)
        b_loss = b_loss + 1;
    end
end

b_loss = b_loss / i;