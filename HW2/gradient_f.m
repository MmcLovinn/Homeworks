function grad_f = gradient_f(X, P, y)
% input: P-positions of the sample, a 2xn^2 matrix
%        y- observed image, as a n^2 vector
%        X- the value for which to compute the gradient 
% output: grad_f - the gradient of f as a 2xn^2 matrix 
    Dphix=Dphi(X,P);
    bigphix=bigphi(X,P);
    delta= bigphix-y;
    grad_f=sum(Dphix.*delta,1);
    grad_f=1/numel(y)*grad_f;
    grad_f=permute(grad_f,[2,3,1]);
end