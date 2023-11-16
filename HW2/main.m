clear;
load("data-toy.mat");
y=mat2vec(y);

% q 2
X1 = [0.1, 0.2; 0.3, 0.4];
X2 = [0.5, 0.6; 0.7, 0.8];

plot_f(X1, X2, P, y);



%check Dphi:

ts= logspace(-8,0, 101);
x=randn(2,1)-1/2;
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
title('error of D\phi');

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
title('error of the gradient of f ')

% q 8:
hesU=mat2vec(hessianf(X,P,y,U));
err3=[];
for t=ts
    f_t=f(X+t*U,P,y);
    err3=[err3, norm(f_t-f_X-t*dot(gradient_f_X,vec_U)-t^2/2*dot(vec_U, hesU) )];
end
figure;
loglog(err3,ts,ts.^3, ts);
title('error of the hessian of f');

% q 11:
clear;
load("data-toy.mat");
X_final=trustregion(X0,P,mat2vec(y),delta_bar,delta_0, 1,0)
plotimage(y);
title('given image');
plotimage(vec2mat(bigphi(X_final,P),n,n));
title('reconstructed image  ');
plotimage(vec2mat(bigphi(X_final,P),n,n)-y);
title('missmatch');

% q 12:
clear;
load("data.mat");
Xs_initial=(randn(2,K,5)-1/2)./4;
Xs_final=zeros(2,K,5);
for i=1:5
    Xs_final(:,:,i)=trustregion(Xs_initial(:, :,i),P, mat2vec(y), delta_bar, delta_0, 50, 0 )
    plotimage(vec2mat(bigphi(Xs_final(:,:,i),P),n,n));
    title('reconstructed image');
end

% q 13:

clear;
load("data.mat");
[X_proper,times,gradientnorms] = trustregion(X0,P,mat2vec(y),delta_bar,delta_0,2*60, 1 );
X_proper 
plotimage(vec2mat(bigphi(X_proper,P),n,n));
title('reconstructed image starting from X_0');
figure;
semilogy(gradientnorms);
title('just norms');
figure;
semilogy( times,gradientnorms);
title('norms with time');



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
