% q 2
X1 = [0.1, 0.2; 0.3, 0.4];
X2 = [0.5, 0.6; 0.7, 0.8];
P = rand(2, 25);  % n^2 = 25 jsp quoi mettre la 
y = rand(25, 1);


plot_f(X1, X2, P, y);


function plot_f(X1, X2, P, y)
    t = linspace(0, 1, 100);
    f_values = zeros(size(t));
    
    for i = 1:length(t)
        X_t = (1 - t(i)) * X1 + t(i) * X2;
        f_values(i) = f(X_t, P, y);
    end
    figure;
    plot(t, f_values);
    xlabel('t');
    ylabel('f((1-t)X_1 + tX_2)');
    title('Plot of f along a line segment');
end