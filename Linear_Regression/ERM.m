x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');
w = 30;
errors = zeros(1,w);
for i=1:w    
    %polynomial curve fitting
    p = designmatrix(x,t,i)';
    results = evalpoly(p,x);
    errors(i) = sum((results - t).^2);
end
figure;
plot([1:1:w],errors,'-*');
title('ERM, sum square loss vs polynomial degree');
xlabel('Degree of polynomial');
ylabel('Empirical Square Loss');
%step 5 visualization
%plot of learned polynomials
figure;
x2 = [-1:.1:1];
plot(x,t,'+');
hold on;
plot(x2,evalpoly(designmatrix(x,t,1)',x2));
plot(x2,evalpoly(designmatrix(x,t,5)',x2));
plot(x2,evalpoly(designmatrix(x,t,10)',x2));
plot(x2,evalpoly(designmatrix(x,t,20)',x2));
plot(x2,evalpoly(designmatrix(x,t,30)',x2));
ylim([-2 2]);
title('Sample output vs input data');
xlabel('input value');
ylabel('output value');
legend('output','W=1','W=5','W=10','W=20','W=30');
hold off;

%plot of errors for W=1,5,10,20,30
data = [errors(1),errors(5),errors(10),errors(20),errors(30)];
figure;
hold on;
plot([1,5,10,20,30],data,'-*');
title('ERM, sum square loss vs polynomial degree');
xlabel('Degree of polynomial');
ylabel('Empirical Square Loss');
hold off;

figure;
plot(x,t,'+',[-1:.1:1],evalpoly(designmatrix(x,t,5)',x2));
title('Sample output vs input data and predictor W=5');
xlabel('input value');
ylabel('output value');
legend('output value','W=5');
