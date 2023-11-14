function Dphi= Dphi(x, P)
sigma=0.1;
phix=phi(x,P);
n2= size(P,2);
xs= ones([size(x),n2]).*x;
[~, sizes_x]=size(x);
Ps=zeros([size(P),sizes_x])+P;
s=numel(sizes_x);
xs=permute(xs,[1,3:s+2, 2 ]);

end 