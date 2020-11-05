input = load('6pointsinputs.txt');
output = load('6pointsoutputs.txt');

input(:,3) = output;
positive = input(input(:,3)==1,:);
negative = input(input(:,3)==-1,:);
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