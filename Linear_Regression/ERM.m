x = load('dataset1_inputs.txt');
t = load('dataset1_outputs.txt');

figure;


%polynomial curve fitting
%for degrees W[1,30], .5 sum(1..30)(y(xn,w)-tn^2)
p = polyfit(x,t,6);
x2 = [-1:.1:1];
result = polyval(p,x2);

plot(x,t,'+',x2,result);