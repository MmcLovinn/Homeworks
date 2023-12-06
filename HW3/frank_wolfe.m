function [xbar, gaps]= frank_wolfe(A, x0, b)
steps_max=1e5;
tol=1e-3;

xbar=x0;
i=0;
nabla=nablaf(xbar,A,b);
sx=linearsubproblem(nabla);
gap=dot(nabla,xbar-sx);
gaps=[gap];
while(i<steps_max&& gap>tol)
    eta=min( dot(sx-xbar,-nabla)/dot(A*(sx-xbar),A*(sx-xbar)), 1);
    eta=max(eta,0);
    xbar=(1-eta)*xbar+eta*sx;
    nabla=nablaf(xbar,A,b);
    sx=linearsubproblem(nabla);
    gap=dot(nabla,xbar-sx);
    gaps=[gaps,gap];
    i=i+1;
end