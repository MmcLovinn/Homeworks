function grad_f = gradient_f(X, P, y)
% input:
% output: 
    Dphix=Dphi(X,P);
    bigphix=bigphi(X,P);
    delta= bigphix-y;
    K=size(X,2);
    grad_f=zeros(2,K);
    for k=1:K
        grad_f(:,k)=Dphix(:,:,k)' *delta;
    end
    grad_f=1/numel(y)*grad_f;
end