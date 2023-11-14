function f_X = f(X, P, y)
% input X - possible star positions.
%       P - positions of the sample pixels, size= 2xn^2
%       y - observed image, as a column vector of size= n^2

n2=numel(y);
f_X=1/(2*n2)*dot(bigphi(X,P)-y,bigphi(X,P)-y);

end 