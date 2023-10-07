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

    [fx, ~]=fhandle(x);
    norm2v= dot(v,v);
    [fxalpha, ~]=fhandle(x-alpha*v);
    while alpha >= alphamin && fx-fxalpha< c*alpha*norm2v
        alpha = rho * alpha;
        [fxalpha, ~]=fhandle(x-alpha*v);
    end
    
    if(rho * alpha < alphamin)
        warning('Backtracking minimum step size reached!');
    end
end