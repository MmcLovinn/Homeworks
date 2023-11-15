function tr = trustregion(X0,P,y, deltabar, delta0 )
rhoprime=1/10;
delta=delta0;
X=X0;
for k= 1:10000
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
end
tr=X;
end