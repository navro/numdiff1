%% Task 4.1
u0 = [2; 0];
mu = 100;
fun = @(t,u) [u(2) ; mu * (1 - u(1).^2) * u(2) - u(1)];
span = [0, 2.*mu];
[tout, yout] = ode15s(fun, span, u0);

figure(1);
plot(tout, yout(:,2));
xlabel('Tid');
ylabel('y_2');

figure(2);
hold on 
p1 = plot(yout(:,1), yout(:,2), 'b');
xlabel('y_1');
ylabel('y_2');

% Checking with different initial values
u0 = [4; 20];
span = [0, 10.*mu];
[~, yout] = ode15s(fun, span, u0);
p2 = plot(yout(:,1), yout(:,2), 'r');

% Changing initial value again
u0 = [-1; 30];
span = [0, 4.*mu];
[~, yout] = ode15s(fun, span, u0);
p3 = plot(yout(:,1), yout(:,2), 'g');

% Display p1 on top
uistack(p1, 'top');
l = legend('$y_0 = [4; 20]$', '$y_0 = [-2; 0]$', '$y_0 = [2; 0]$', 'Location', 'NorthWest');
set(l, 'Interpreter', 'latex');

%% Task 4.2 & 4.3
mu = [10; 15; 22; 33; 47; 68; 100; 150; 220 ; 330 ; 470 ; 680; 1000];
t0 = 0; tf = 0.7.*mu; tol = 1E-8; u0 = [2; 0];
R = zeros(1,length(mu)); % Using adaptiveRK34
O = zeros(1, length(mu)); % Using ODE15s

for k= 1:length(mu)
    fun = @(t,u) [u(2) ; mu(k) * (1 - u(1).^2) * u(2) - u(1)];
    [ta,~] = adaptiveRK34(fun, u0, t0, tf(k), tol);
    R(k) = length(ta) - 1;
    
    [tb,~] = ode15s(fun, [t0, tf(k)], u0);
    O(k) = length(tb) - 1;
end

% Fit to a power function
f = fit(mu,R','power1')
int = mu(1):1:mu(end);

figure(3);
loglog(mu, R', '*b');
hold on;
loglog(mu, O', '*r');
loglog(int,feval(f,int));
