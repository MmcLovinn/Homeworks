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
verbose=params.verbose;
tolgradnorm = params.tolgradnorm;

gradnorms = zeros(1, maxiters + 1);
times = zeros(1, maxiters + 1);
xk=x0;
tic
for i = 1:maxiters
    [fk , gk]= fhandle(xk);
    gradnorms(1,i)=norm(gk);
    times(1,i)=toc;
    if(verbose)
        fprintf('iteration : %d\n', i);
        fprintf('current cost function value: %d\n', fk);
        fprintf('time elapsed: %d seconds\n',toc);
    end
    if(gradnorms(1,i)/gradnorms(1,1)<=tolgradnorm || times(1,i) >maxtime )
        break;
    else
        alpha=linesearch(fhandle,xk, gk,lsparams);
        xk=xk-alpha*gk;
    end
end
theta = xk;
gradnorms = gradnorms(1:i);
times = times(1:i);
end