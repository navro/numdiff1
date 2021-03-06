function RK4errVSh(lambda, y0, t0, tf)

j = 4:16;
Ns = 2.^j;
vals = zeros(1,length(j));
hs = (tf - t0)./Ns;

for i=1:length(j)
    [~, err] = RK4int(lambda, y0, t0, tf, Ns(i));
    vals(i) = norm(err);
end

% Fit to a exponential function
f = fit(hs(1:end-4)',vals(1:end-4)','power1')
int = hs(end):0.0001:hs(1);

figure(37);
p1 = loglog(hs, vals, '*');
hold on;
grid on;
p2 = loglog(int,feval(f,int));
xlabel('Stegstorlek');
ylabel('Globalt fel');
legend([p1,p2], 'Fel', '\it{C \cdot h^4}','Interpreter','Tex','Location','NorthWest');

end