% WRITE YOU CODE HERE!!! 

function Z = projectData(X, U, K)
Z = zeros(size(X, 1), K);%set size of z with zero
U_red = U(:,1:K);%We got the k principle value of u 
for i = 1:size(X,1)
	Z(i,:) = (U_red'*X(i,:)')';%The value of z is given with the reduced values.
end
end