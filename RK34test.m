% Test plot with A = lambda = 1
f = @(t, y) y;
t0 = 0;
tf = 1;
y0 = 1;
tol = 0.00000000001;

[t, y] = adaptiveRK34(f, y0, t0, tf, tol);

figure(1);
hold on;
plot(t,y,'b');  % Blue is explicit RK4
plot(0:0.001:1,exp(0:0.001:1),'g'); % Green is exp(x)