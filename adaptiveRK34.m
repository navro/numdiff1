function [t,y] = adaptiveRK34(f, y0, t0, tf, tol)

hold = abs(tf - t0) .* tol.^(1./4) ./ (100 .* (1 + norm(f(t0, y0))));
errold = tol;
uold = y0;

y = [y0];
t = [t0];

while t(end) < tf
    [~, err] = RK34step(f, uold, t0, hold);
    hold = newstep(tol, err, errold, hold, 4);
    [uold, errold] = RK34step(f, uold, t0, hold);
    y = [y uold];
    t = [t (t(end) + hold)];
end

h = tf - t(:, end - 1);
y(:,end) = RK34step(f, y(:, end - 1), t0, h);
t(:,end) = tf;

end