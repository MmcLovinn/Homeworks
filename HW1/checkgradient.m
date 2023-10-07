function checkgradient(fhandle, theta, v)

ts=logspace(-8, 0, 101);
error=zeros(size(ts));
[f_theta,g_theta]= fhandle(theta);
for i= 1:size(ts,2)
    [f_t, ~ ]=fhandle(theta+ts(1,i)*v);
    error(1,i)=abs(f_t-f_theta - ts(1,i)*dot(v,g_theta));
end
figure('Name','Error vs O(t^2)','NumberTitle','off')
loglog(ts,error,'--', ts, ts.^2);
legend('error', 'O(t^2)');
end