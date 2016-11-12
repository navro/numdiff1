u0 = [2; 0];
fun = @(t,u) [u(2) ; mu * (1 - u(1).^2) * u(2) - u(1)];
mu = 100;
span = [0, 2.*mu];
[tout, yout] = ode15s(fun, span, u0);

figure(1);
plot(tout, yout(:,2));

figure(2);
hold on 
plot(yout(:,1), yout(:,2));

% checking with different initial values
u0 = [4; 8];
span = [0, 50.*mu];
[tout, yout] = ode15s(fun, span, u0);
plot(yout(:,1), yout(:,2), 'g');

%Task 4.2 & 4.3
mu = [10; 15; 22; 33; 47; 68; 100; 150; 220 ; 330 ; 470 ; 680 ; 1000];
t0 = 0; tf = 0.7.*mu; tol = 1E-9; u0 = [2; 0];
N = zeros(1,length(mu)); % Using adaptiveRK34
P = zeros(1, length(mu)); % Using ODE15s

for k= 1:length(mu)
    [ta,ya] = adaptiveRK34(fun, u0, t0, tf(k), tol);
    N(k) = length(ta) - 1;
    
    [tb,yb] = ode15s(fun, [t0, tf(k)], u0);
    P(k) = length(yb) - 1;
end

figure(3);
loglog(mu, N, '*b');
hold on;
loglog(mu, P, '*r');
grid on;
f = fit(mu,transp(N),'power1');
