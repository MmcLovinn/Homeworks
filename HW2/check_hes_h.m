v=randn(2,1);
u=randn(2,1);
ts= logspace(-8,0, 101);
hv=h(v);
gv=gradient_h(v);
hesv=hessian_h(v);
err_h=[];
for t=ts
    hu= h(v+t*u);
    err_h=[err_h abs(hu-hv- t*dot(u,gv)-t^2/2*dot(u,hesv*u) )];
end
figure;
loglog(err_h,ts,ts.^3, ts);