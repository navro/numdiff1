function hnew = newstep( tol, err, errold, hold, k )

rnew = norm(err);
rold = norm(errold);

hnew = (tol/rnew)^(2./(3.*k)) * (tol/rold)^(-1./(3.*k)) * hold;

end

