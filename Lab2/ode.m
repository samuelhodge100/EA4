function [t_out,y_out] = ode(rhs,t, y_init, opt)
t_init = t(1);
t_fin = t(2);
t_out = zeros(1,ceil(t_fin/opt.stepsize));
y_out = zeros(1,length(t_out));
t_out(1) = t_init;
y_out(1) = y_init;
for step = 1:ceil((t_fin-t_init)/opt.stepsize)
    if step > 1 && t_out(step-1)  > t_fin
        opt.stepsize = t_fin - max(t_out);
    end
    [t_out(step+1),y_out(step+1)] = RK4step(rhs,t_out(step),y_out(step),opt);
end

