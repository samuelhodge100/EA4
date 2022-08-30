g = input('1,2,3: ');
    global alpha beta s0 
    alpha = 1;
    beta = 2;
if g == 1
    test.stepsize = 0.1;
    t_input = [0 15];
    i0 = 0.01;
    [t,i] = ode(@rhsSIS,t_input,i0,test);
    
    [t1,i1] = ode45(@rhsSIS, [0,15],0.01);
    t2 = 0:0.1:15;
    top = t2*(alpha-beta);
    i2 = (1-alpha/beta)./(1+((1-alpha/beta)/i0-1)*exp(top));
    
    plot(t,i,'-r')
    hold on
    plot(t1,i1,'--b')
    plot(t2,i2,'--k')
    title('Analytic vs ODE45 vs Our Solver')
    legend('Our RK','ode45','analytic')
    xlabel('time')
    ylabel('infected population (%)')
end
if g == 2
    treal =  0.026279699676365;
    test.stepsize = 0.5;
    t_input = [0,1];
    i0 = 0.01;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error1 = abs(i(end) -treal);

    
    test.stepsize = 0.1;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error2 = abs(i(end) -treal);

    
    test.stepsize = 0.02;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error3 = abs(i(end) -treal);

    
    test.stepsize = 0.004;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error4 = abs(i(end) -treal);

    
    test.stepsize = 0.001;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error5 = abs(i(end) -treal);
    
    test.stepsize = 0.0001;
    [~,i] = ode(@rhsSIS,t_input,i0,test);
    error6 = abs(i(end) -treal);
    
    h = [0.5,0.1,0.02,0.004,0.001,0.0001];
    error = [error1,error2,error3,error4,error5,error6];
    plot(log(h),log(error))
    title('log of step size vs log of error')
    xlabel('log of step size')
    ylabel('log of error')
    
end
if g == 3
    test.stepsize = 0.001;
    s0 = 0.99;
    [t,r] = ode(@rhsSIR,[0,15],0,test);
    s = s0*exp(-1*beta/alpha*r);
    i = 1-s-r;
    plot(t,r,'--r')
    hold on
    plot(t,s,'--b')
    plot(t,i,'--k')
    legend('r','s','i')
    title('SIR Response over time')
    xlabel('time')
    ylabel('population (%)')
end
    
