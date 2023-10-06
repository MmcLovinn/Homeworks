function [theta, gradnorms, times] = cstgradientdescent(fhandle, x0, alpha, params)
    maxiters = params.maxiters;
    maxtime = params.maxtime;
    tolgradnorm = params.tolgradnorm;
    
    gradnorms = zeros(1, maxiters + 1);
    times = zeros(1, maxiters + 1);

    % ... your code here ...

    theta = xk;
    gradnorms = gradnorms(1:iter);
    times = times(1:iter);
end