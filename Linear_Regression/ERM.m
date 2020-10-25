x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');
w = 30;
errors = zeros(1,w);
for i=1:w    
    %polynomial curve fitting
    p = polyfit(x,t,i);
    results = polyval(p,x);
    errors(i) = sum(0.5 .* (results - t).^2);
end
figure;
plot([1:1:w],errors,'-*');
title('ERM, sum square loss vs polynomial degree');
xlabel('Degree of polynomial');
ylabel('Empirical Square Loss');

figure;

x2 = [-1:.1:1];
plot(x,t,'+',x2,polyval(polyfit(x,t,6),x2));

title('Sample output vs input data');
xlabel('input data');
ylabel('output data');
legend('output','W=6');






