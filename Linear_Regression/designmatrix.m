function coeff = designmatrix(input,output,deg)
dmat = zeros(100,deg+1);
dmat(:,1) = 1;
if deg == 1
    dmat(:,2) = input;
else
    for i=1:deg
        dmat(:,i+1) = input .^ i;
    end
end

coeff = (dmat' * dmat) \ (dmat'*output);

end