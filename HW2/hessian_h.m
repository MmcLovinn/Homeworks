function hesh= hessian_h(v)
    sigma=0.1;
    h_v=h(v);
    hesh=[1-2/(sigma^2)*v(1)*v(1), -v(1)*v(2)* 2/(sigma^2) ; -v(1)*v(2)* 2/(sigma^2), 1-2/(sigma^2)*v(2)*v(2)  ];
    hesh=-2/(sigma^2)*h_v*hesh;
end