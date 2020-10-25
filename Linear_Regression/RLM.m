x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');

p = polyfit(x,t,20);
result = polyval(p,x);
errors = zeros(1,20);
n = norm(p)^2;
for i=1:20
    errors(i) = sum(0.5 .* (results - t).^2 + (exp(-i)/2 * n));
end

figure;
plot([1:1:20],errors,'-*');
title('RLM, regularized square loss vs -ln(lambda)');
xlabel('-ln(lambda)');
ylabel('Regularized Square Loss');