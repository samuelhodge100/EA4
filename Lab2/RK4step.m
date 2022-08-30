function [t,y] = RK4step(rhs,t_in,y_in,opt)
h = opt.stepsize;
k1 = rhs(t_in,y_in);
k2 = rhs(t_in + h/2,y_in + k1*h/2);
k3 = rhs(t_in + h/2,y_in + k2*h/2);
k4 = rhs(t_in + h,y_in + k3*h);
y = y_in + 1/6*h*(k1 + 2*k2 + 2*k3 + k4);
t = t_in + h;