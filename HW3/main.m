clear
load data.mat


x0=abs(randn(size(x)));
x0=x0./sum(x0);

[xbar, gaps] =frank_wolfe(A,x0,b);

semilogy(gaps);

figure;
plot_data(x,xbar, A\b);
