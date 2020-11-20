x = -5:.01:5;
log_loss = log(1 + exp(-x));
log_grad = gradient(log_loss);
quad_loss = (max(0, 1-x)).^2;
exp_loss = exp(-x);
bin_loss = (x(:)<=0)';
hinge_loss = max(0, 1 - x);

figure;
hold on;
grid on;

plot(x,log_loss,'LineWidth',2.5);
plot(x,quad_loss,'LineWidth',2.5);
plot(x,exp_loss,'LineWidth',2.5);
plot(x,bin_loss,'LineWidth',2.5);
plot(x,hinge_loss,'LineWidth',2.5);
legend('Logistic Loss','Quadratic Loss','Exponential Loss','Binary Loss','Hinge Loss');
title('Plot of Various Loss Functions');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-5,5]);
ylim([-1,10]);