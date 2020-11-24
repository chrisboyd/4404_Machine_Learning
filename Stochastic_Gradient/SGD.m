function w = SGD(f, v, n, T)
w = zeros(1,T+1);

for i=1:T
    x = ceil(rand * size(v,2));
    w(i+1) = w(i) - n * f(x);
end
w = 1/T * sum(w);

end