function [tcg, m, flag] = tCG(delta, X, P, y)
    b=-gradient_f(X,P,y);
    r=b;
    normb=norm(r);
    p=r;
    v=zeros(size(r));
    for n=1:numel(X)
        hp=hessianf(X,P,y,p);
        php=dotmat(p,hp);
        alpha=dotmat(r,r)/php;
        vplus=v+alpha*p;
        if php<=0 || norm(vplus)>delta
            t= (-dotmat(v,p)+sqrt(dotmat(v,p)^2-dotmat(p,p)*(dotmat(v,v)-delta*delta)));    
            v=v+t*p;
            tcg=v;
            flag=1;
            Hu=b-r+t*hp;
            m=1/2*dotmat(tcg,Hu)-dotmat(b,tcg);
            break;
        else
            v=vplus;
            beta=dotmat(r,r);
            r=r-alpha*hp;
            if norm(r)<min(normb,0.1)
                tcg=v;
                flag=0;
                Hu=b-r;
                m=1/2*dotmat(tcg,Hu)-dotmat(b,tcg);
                break;
            end
            beta=dotmat(r,r)/beta;
            p=r+beta*p;
        end
    end
end