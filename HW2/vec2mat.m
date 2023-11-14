function X = vec2mat(x, m, n)
% Reshapes a vector x into a m*n matrix.
% If m and n are not given the it tries to make a square matrix.
    if nargin == 1
        m = sqrt(numel(x));
        if mod(m, 1) ~= 0
            error('vec2mat: Cannot make a square matrix from the input vector.')
        end
        n = m;
    end
    X = reshape(x, m, n);
end