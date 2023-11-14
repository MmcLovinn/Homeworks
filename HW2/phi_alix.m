function phi_x = phi_alix(x, P)
    sigma = 0.1;
    diff = P - x;
    norms_squared = sum(diff.^2, 1);
    phi_x = exp(-norms_squared / (sigma^2));
    phi_x = phi_x';
end