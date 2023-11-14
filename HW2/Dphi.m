function Dphi= Dphi(x, P)
sigma=0.1;
phix=phi(x,P);
phix=2/(sigma^2)*phix;
n2= size(P,2);
xs= ones([size(x),n2]).*x;
[~, sizes_x]=size(x);
Ps=zeros([size(P),sizes_x])+P;
s=numel(sizes_x);
xs=permute(xs,[1,s+2, 2:s+1 ]);
diff= -xs+ Ps;
diff= permute(diff,[2:s+2, 1]);
Dphi=diff.*phix;
Dphi= permute(Dphi, [1, s+2, 2: s+1]);
end 