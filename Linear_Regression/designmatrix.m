function coeff = designmatrix(input,output,deg)
%populates the design matrix as specified in lecture8.pdf
%input: vector of input values
%output: vector of expected output values
%deg: degree of polynomial to create design matrix for
%coeff: returns a column vector of size deg+1, with constant term 
%       in the first index, then increasing degree row by row
%
%Note: does not verify input, not tested for degrees <1 or >30

dmat = zeros(numel(input),deg+1);
%set first column equal to 1
dmat(:,1) = 1;

if deg == 1
    dmat(:,2) = input;
else
    for i=1:deg
        dmat(:,i+1) = input .^ i;
    end
end
%transpose for ease of evaluation with evalpoly
coeff = ((dmat' * dmat) \ (dmat'*output))';

end