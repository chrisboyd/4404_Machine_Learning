function results = evalpoly(poly, x)
%evaluates the given polynomial, poly, at value x
%
%poly:column vector of polynomial coefficients with constant term in 
%     the first index, increasing in power from there
%x   :value to evaluate polynomial with
%results: column vector same number of elements as x
%
%Note: no input verification

pow = [0:1:numel(poly)-1];
results = zeros(numel(x),1);
for i=1:numel(x)
results(i) = sum(poly .* x(i).^pow);
end