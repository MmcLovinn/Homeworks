clear;
load("data-toy.mat");

% q 2
X1 = [0.1, 0.2; 0.3, 0.4];
X2 = [0.5, 0.6; 0.7, 0.8];
y=mat2vec(y);
plot_f(X1, X2, P, y);



%check Dphi:

ts= logspace(-8,0, 101);
x=randn(2,1);
v=randn(2,1);
phix=phi(x,P);
Dphix=Dphi(x,P);
err_phi=[];
for t=ts
    phit=phi((x+t*v),P);
    err_phi=[err_phi, norm(phit-phix-t*Dphix*v)];
end
figure;
loglog(err_phi,ts, ts.^2, ts);

% q 6:
ts= logspace(-8,0, 101);
K=10;
X= randn(2,K)-1/2;
U= randn(2,K);
vec_U=mat2vec(U);
f_X=f(X,P,y);
gradient_f_X=mat2vec(gradient_f(X,P,y));
err_f=[];
for t=ts
    f_t=f(X+t*U,P,y);
    err_f=[err_f, norm(f_t-f_X-t*dot(gradient_f_X,vec_U))];
end
figure;
loglog(err_f,ts, ts.^2,ts);

% q 8:
hesU=mat2vec(hessianf(X,P,y,U));
err3=[];
for t=ts
    f_t=f(X+t*U,P,y);
    err3=[err3, norm(f_t-f_X-t*dot(gradient_f_X,vec_U)-t^2/2*dot(vec_U, hesU) )];
end
figure;
loglog(err3,ts,ts.^3, ts);


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
