function phi_x = phi(x, P)
% input:    x - values for which to compute phi, first dimension has to be of
%                size 2
%           P- sample pixels positions an 2xn^2 matrix
% output:   phi_x - the values of phi at x
n2= size(P,2);
xs= ones([size(x),n2]).*x;
[~, sizes_x]=size(x);
Ps=zeros([size(P),sizes_x])+P;
s=numel(sizes_x);
xs=permute(xs,[1,3:s+2, 2 ]);
phi_x= -xs+ Ps;
phi_x= h(phi_x);
end 