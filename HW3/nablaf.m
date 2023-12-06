function nabla= nablaf(x,A,b)
    nabla= A.'*(A*x-b);
end