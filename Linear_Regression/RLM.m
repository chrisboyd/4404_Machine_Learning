x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');

p = designmatrix(x,t,30);
results = evalpoly(p,x);
errors = zeros(1,30);
n = norm(p)^2;
%get error for each lambda value [1,30]
for i=1:30
    errors(i) = sum((results - t).^2 + (1/exp(i) * n));
end
%plot errors for each lambda value
figure;
plot([1:1:30],errors,'-*');
title('RLM, regularized square loss vs ln(lambda)');
xlabel('ln(lambda) * -1');
ylabel('Regularized Square Loss');

%step 5 visualization
w = [1,5,6,10,20,30];
disp_errors = zeros(1,6);
for j=1:6
    p = designmatrix(x,t,w(j));
    disp_data = evalpoly(p,x);
    disp_norm = norm(p)^2;
    disp_errors(j) = sum(0.5 .* (disp_data - t).^2 + (0.0025/2 * disp_norm)); 
end

%plot of errors for W=1,5,10,20,30
figure;
hold on;
plot(w,disp_errors,'-*');
ylim([0,100]);
title('RLM, sum square loss vs polynomial degree with lambda = 0.0025');
xlabel('Degree of polynomial');
ylabel('Empirical Square Loss');