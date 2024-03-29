x = -5:.01:5;
log_loss = log(1 + exp(-x));
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

hold off;
%gradient for log, quadratic and exponential loss functions
log_grad = -1 ./ (exp(x) +1);
quad_grad = -2*(1-x);
exp_grad = -exp(-x);
figure;
hold on;
grid on;
plot(x,log_grad);
plot(x,quad_grad);
plot(x,exp_grad);
legend('Logistic Gradient','Quadratic Gradient','Exponential Gradient');
title('Plot of Logistic, Quadratic and Exponential Gradients');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-5,5]);
ylim([-5,5]);

w_log = SGD(log_grad,x,.1,100);
w_quad= SGD(quad_grad, x,.1,100);
w_exp = SGD(exp_grad,x,.1,100);

