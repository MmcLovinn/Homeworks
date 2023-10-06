function [u,v] = phi(z)
%returns phi and phi' as a vector

% Initialize u and v with default values for z > 0
u = 0.5 + z;
v = ones(size(z));
 
% Indices for different conditions
idx1 = z <= -1;
idx2 = z > -1 & z <= 0;
 
% Update values for the conditions
u(idx1) = 0;
u(idx2) = 0.5 * (1 + z(idx2)).^2;
 
v(idx1) = 0;
v(idx2) = 1 + z(idx2);
 

end

