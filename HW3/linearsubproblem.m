function sx=linearsubproblem(w)
    sx=double(w<=min(w));
    sx=sx./sum(sx);
end