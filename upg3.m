% Part 1 (x and y as fun! of t)
y0 = [1 ; 1];
tol = 1E-11;
t0 = 0;
tf = 12;
f = @(t,u) lotka(t,u);

[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
figure(1);
plot(t,y,[0 0],[0 0],'w',[0 0],[0 0],'w');
xlabel('Tid');
ylabel('Relativ population');
l = legend('Kaniner', 'R\"avar', '$y_0 = [1; 1]$', 'tol = $1\cdot 10^{-11}$', 'Location', 'NorthWest');
set(l, 'Interpreter', 'latex');

% Part 2 (y as fun of x)
figure(2);
hold on;
plot(y(1,:),y(2,:),'b');
xlabel('Relativ population kaniner');
ylabel('Relativ population rävar');

% Part 3: Change initial conditions
figure(3);
y0 = [10 ; 1];
[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
plot(t,y,[0 0],[0 0],'w',[0 0],[0 0],'w');
xlabel('Tid');
ylabel('Relativ population');
l = legend('Kaniner', 'R\"avar', '$y_0 = [10; 1]$', 'tol = $1\cdot 10^{-11}$', 'Location', 'NorthWest');
set(l, 'Interpreter', 'latex');

% Phase portrait for new initial condition
figure(2);
plot(y(1,:),y(2,:),'r');

% Let y0 = [d/c, a/b] (equilibrium)
figure(4);
y0 = [1 ; 0.3333];
[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
plot(t,y,[0 0],[0 0],'w',[0 0],[0 0],'w');
xlabel('Tid');
ylabel('Relativ population');
l = legend('Kaniner', 'R\"avar', '$y_0 = [1; 0.3333]$', 'tol = $1\cdot 10^{-11}$', 'Location', 'NorthWest');
set(l, 'Interpreter', 'latex');

% Phase portrait for new initial condition
figure(2);
plot(y(1,:),y(2,:),'g',[0 0], [0 0], 'w');
l = legend('$y_0 = [1; 1]$', '$y_0 = [10; 1]$', '$y_0 = [1; 0.3333]$', 'tol = $1\cdot 10^{-11}$', 'Location', 'NorthEast');
set(l, 'Interpreter', 'latex');

% Part 4
figure(5);
tf = 500;
y0 = [1; 1];
tol = 1E-8;
[t,y] = adaptiveRK34(f,y0,t0,tf,tol);
H = @(x,y) 15.*x + 9.*y - 15.*log(x) - 3.*log(y);
plot(t,abs(H(y(1,:),y(2,:))./H(y0(1),y0(2))-1));
hold on;
p2  = plot([0 0], [0 0], 'w');
xlabel('Tid');
ylabel('$|H(x,y)/H(0,0) - 1|$', 'Interpreter', 'latex');
l = legend(p2, 'tol = $1\cdot 10^{-11}$', 'Location', 'NorthWest');
set(l, 'Interpreter', 'latex');