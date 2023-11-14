function x = mat2vec(X)
% Stacks the columns of a matrix X to make a vector.
    [m, n] = size(X);
    x = reshape(X, [m*n 1]);
end