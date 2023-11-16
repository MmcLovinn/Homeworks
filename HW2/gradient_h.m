function nablah= gradient_h(v)
    sigma=0.1;
    h_v=h(v);
    nablah=-2/(sigma^2)*h_v*v';
end