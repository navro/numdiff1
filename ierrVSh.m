function gerr = ierrVSh(A, y0, t0, tf)

j = 1:20;
Ns = 2.^j;
vals = zeros(1,length(j));
hs = (tf - t0)./Ns;

for i=1:length(j)
    [approx, err] = ieulerint(A, y0, t0, tf, Ns(i));
    vals(i) = norm(err);
end

loglog(hs, vals);

end