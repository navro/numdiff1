function [ approx, err ] = RK4int( lambda, y0, t0, tf, N )

h = (tf - t0) ./ N;
u = y0;
f = @(told, y) lambda.*y;

for i = 1:N
    u = RK4step(f, u, 37, h);
end

approx = u;
exact = expm(lambda*(tf-t0))*y0;

err = approx - exact;
end