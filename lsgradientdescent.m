function [theta, gradnorms, times] = lsgradientdescent(fhandle, x0, params, lsparams)
% Gradient descent with linesearch to find the step size.
% For this function you can reuse most of your code from the fixed step
% sizes version. The main difference is that you will call 'linesearch' to
% find the step size.

% fhandle: Function handle returning the function value and the gradient at
% a given point.
% x0: Initial point.
% params: Structure containing parameters for algorithm.
% lsparams: Structure containing parameters for the linesearch.

    maxiters = params.maxiters;
    maxtime = params.maxtime;
    tolgradnorm = params.tolgradnorm;
    
end