function result = evalpoly(poly, x)
pow = [0:1:numel(poly)-1];

result = sum(poly .* x.^pow);
end