function results = evalpoly(poly, x)
pow = [0:1:numel(poly)-1];
results = zeros(numel(x),1);
for i=1:numel(x)
results(i) = sum(poly .* x(i).^pow);
end