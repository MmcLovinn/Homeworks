function [theta, gradnorms, times] = cstgradientdescent(fhandle, x0, alpha, params)
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
            fprintf('time elapsed: %d minutes\n',toc/60);
        end
        if(gradnorms(1,i)/gradnorms(1,1)<=tolgradnorm || times(1,i) >maxtime )
            break; 
        else 
            xk=xk-alpha*gk;
        end    
    end
    theta = xk;
    gradnorms = gradnorms(1:i);
    times = times(1:i);
end