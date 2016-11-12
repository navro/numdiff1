%Task 4.2 & 4.3
mu = [10; 15; 22; 33; 47; 68; 100; 150; 220 ; 330 ; 470 ; 680; 1000]; 
t0 = 0;
tf = 0.7*mu;
tol = 1E-8;
u0 = [2; 0];

for k = 1:length(mu)
    fun = @(t,u) [u(2) ; mu(k) * (1 - u(1).^2) * u(2) - u(1)];
    [ta,~] = adaptiveRK34(fun, u0, t0, tf(k), tol);
    N(k) = length(ta) - 1;
    
    [tb,~] = ode15s(fun, [t0, tf(k)], u0);
    P(k) = length(tb) - 1;
end

figure(3);
loglog(mu, N', '*b');
hold on;
loglog(mu, P', '*r');
grid on;
