function [tr,times,gradientnorms] = trustregion(X0,P,y, deltabar, delta0, time_max, verbose )
rhoprime=1/10;
tol=10^-13;
delta=delta0;
X=X0;
tic;
times=[];
gradientnorms=[];
gradnorm=1;
while toc<time_max && gradnorm>tol
    [u,m,flag]=tCG( delta,X, P, y);
    Xplus=X+u;
    rho=-(f(X,P,y)-f(Xplus,P,y))/m;
    if rho>rhoprime
        X=Xplus;   
    end
    if rho<1/4
        delta=1/4*delta;
    elseif rho>3/4 && flag==1
        delta=min(deltabar,2*delta);
    end
    gradnorm= norm(mat2vec(gradient_f(X,P,y)));
    if(verbose==1)
        times=[times, toc];
        gradientnorms=[gradientnorms,gradnorm];
    end
end
tr=X;
end