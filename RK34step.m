function [unew, err] = RK34step(f, uold, told, h)

yp1 = f(told, uold);
yp2 = f(told + h./2, uold + h*yp1./2);
yp3 = f(told + h./2, uold + h*yp2./2);
yp4 = f(told + h, uold + h*yp3);
zp3 = f(told + h, uold - h*yp1 + 2*h*yp2);

unew = uold + h./6 * (yp1 + 2.*yp2 + 2.*yp3 + yp4);
err = h./6 * (2.*yp2 + zp3 - 2.*yp3 - yp4);

end

