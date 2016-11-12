% Test plot with A = lambda = 1
A = 1;
t0 = 0;
tf = 1;
y0 = 1;

x = 0:0.1:1;
y = zeros(1,11);

for i=0:1:10
    y(i+1) = eulerint( A, y0, t0, x(i+1), i);
end

figure(1);
hold on;
plot(x,y,'b');  % Blue is explicit euler
plot(0:0.001:1,exp(0:0.001:1),'g'); % Green is exp(x)

% Task 1.3
A = 3;
figure(7);
errVSh(A,y0,t0,tf);


% Task 1.4
A = [-1, 10; 0, -3];
y0 = [1 ; 1];
t0 = 0;
tf = 10;
figure(2);
errVSh(A, y0, t0, tf);

% Implicit Test
A = 1;
t0 = 0;
tf = 1;
y0 = 1;

x = 0:0.1:1;
y = zeros(1,11);

for i=0:1:10
    y(i+1) = ieulerint( A, y0, t0, x(i+1), i);
end

figure(1);
hold on;
plot(x,y, 'r'); % Red is implicit


% Task 1.5.0
A = [-1, 10; 0, -3];
y0 = [1 ; 1];
t0 = 0;
tf = 10;
figure(4);
ierrVSh(A, y0, t0, tf);

% Task 1.5
% Explicit
A = [-1, 100; 0, -30];
y0 = [1 ; 1];
t0 = 0;
tf = 10;

x = 0:0.01:0.99;
y = zeros(1,100);
z = zeros(1,100);
ex = zeros(1,100); % The exact solutions

for i=0:99
    [approx, error] = eulerint( A, y0, t0, x(i+1), i);
    y(i+1) = norm(error);
    z(i+1) = norm(approx);
    ex(i+1) = norm(approx - error);
end

% Figure 5 for errors, Figure 6 for norm of solutions
figure(5);
hold on;
plot(x,y, 'b');

figure(6);
hold on;
plot(x,z, 'b');
plot(x, ex, 'g');  % Norm of exact solution

% Implicit
for i=0:1:99
    [approx, error] = ieulerint( A, y0, t0, x(i+1), i);
    y(i+1) = norm(error);
    z(i+1) = norm(approx);
end

figure(5);
hold on;
plot(x,y,'r');

figure(6);
hold on;
plot(x,z,'r');