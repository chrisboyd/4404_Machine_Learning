function bloss = binary_loss(weight, data, labels)
%compute average binary loss for given weight vector over all 
%inputs and respective labels
	bloss = 0;
	for i=1:size(labels)
	    sign = dot(weight,data(i,:)) * labels(i);
	    sign = sign / abs(sign);
	    sign = (.5 * sign - .5);
	    if sign ~= 0
	        sign = 1;
	    end
	    bloss = bloss + sign;
	end

	bloss = bloss / i;
	end