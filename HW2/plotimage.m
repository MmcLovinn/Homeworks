function plotimage(X)
    [m, n] = size(X);
    if m ~= n
        warning('plotimage: Input matrix is not square.');
    end
    x = linspace(-.5, .5, m);
    y = linspace(-.5, .5, n);
    figure;
    imagesc(x, y, X);
    colorbar;
    axis equal;
    axis tight;
    drawnow;
end