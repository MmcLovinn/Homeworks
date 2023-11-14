function h = h(X)
% input:    X - an N-D array where the size along the first dimension is 2
% output:   h - the gaussian filter function applied to X "element"-wise 
%               returns an N-D array where the first dimension is 1
    sigma= 0.1;
    h= -sum(X.^2);
    h= exp(h./(sigma.^2));
end