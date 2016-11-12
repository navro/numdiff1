function [ approx, err ] = eulerint( A, y0, t0, tf, N )

h = (tf - t0) ./ N;
u = y0;

for i = 1:N
    u = eulerstep(A, u, h);
end

approx = u;
exact = expm(A*(tf-t0))*y0;

err = approx - exact;
end