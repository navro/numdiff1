% Part 1 (x and y as fun! of t)
y0 = [1 ; 1];
tol = 1E-11;
t0 = 0;
tf = 12;
f = @(t,u) lotka(t,u);

[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
figure(1);
plot(t,y);

% Part 2 (y as fun! of x)
figure(2);
plot(y(1,:),y(2,:));

% Part 3: Change initial conditions
figure(3);
y0 = [10 ; 1];
[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
plot(t,y);

% Part 4
figure(4);
tf = 200;
y0 = [1; 1];
tol = 1E-8;
[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
H = @(x,y) 15.*x + 9.*y - 15.*log(x) - 3.*log(y);
loglog(t,abs(H(y(1,:),y(2,:))./H(y0(1),y0(2))-1));