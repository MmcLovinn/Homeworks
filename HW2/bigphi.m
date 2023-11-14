function big_phi_X = bigphi(X, P)
% input X- vector of possible positions for the stars
%       P- vector of the positions of the sample pixels size: 2xn^2
% output: the value of the function capital phi

phi_X=phi(X,P);
big_phi_X=sum(phi_X,3);
end
