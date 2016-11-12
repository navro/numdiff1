% Test plot with A = lambda = 1
lambda = 1;
t0 = 0;
tf = 1;
y0 = 1;

x = 0:0.1:1;
y = zeros(1,11);

for i=0:1:10
    y(i+1) = RK4int( lambda, y0, t0, x(i+1), i);
end

figure(1);
hold on;
plot(x,y,'b');  % Blue is explicit RK4
plot(0:0.001:1,exp(0:0.001:1),'g'); % Green is exp(x)

% Global error loglog
lambda = 3;
figure(2);
RK4errVSh(lambda,y0,t0,tf);