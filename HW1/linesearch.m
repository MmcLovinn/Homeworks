function alpha = linesearch(fhandle, x, v, lsparams)
% Performs linesearch to find a step size.

% fhandle: Function handle returning the function value and the gradient at
% a given point.
% x: Point where to perform the linesearch.
% v: Search direction.
% lsparams: Structure containing parameters for the algorithm.

    alphabar = lsparams.alphabar;
    c = lsparams.c;
    rho = lsparams.rho;
    alphamin = lsparams.alphamin;

    alpha = alphabar;

    % ...

    while alpha >= alphamin
        % ...
        alpha = rho * alpha;
    end
    
    if(rho * alpha < alphamin)
        warning('Backtracking minimum step size reached!');
    end
end