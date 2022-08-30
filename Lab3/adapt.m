global beta count m k
[m,k,beta,h,hbig,hsmall,hcut,hraise,e,xinit,yinit,tfin,tinit] = readvars('/Users/samuelhodge/Desktop/Northwestern/Fall Quarter (Sophomore)/EA4/Lab#3 Soft vs Hard Spring System/lab 3/EA4_test_file.xlsx');

t = [tinit];
x = [xinit];
y = [yinit];
step = 1;
count = 0;
% initialize vars
while t(step) < tfin
    tnew = t(step) + h;
    % take a new step attempt
    if tnew > tfin
        % check if step exceeds max value, if so assign it to tfin and
        % change h. 
        h = tnew - tfin;
        tnew = tfin;
    end
    [xko,yko] = prime(t(step),x(step),y(step));
    % take predictor step
    xlow = h*xko + x(step);
    ylow = h*yko + y(step);
    [xk1,yk1] = prime(tnew,xlow,ylow);
    xhigh = x(step) + h/2*(xk1+xko);
    yhigh = y(step) + h/2*(yk1+yko);
    % take corrector step
    err = max(abs(xhigh-xlow),abs(yhigh-ylow));
    % compute the error between corrector steps and predictor steps
    if err > e
        if h<hsmall
            break
        end
        h = h/hcut;
        % lower h if the error is too high. If h gets too small, stop the
        % program. 
    else
        step = step + 1;
        x(step) = 1/2*h*(xk1+xko)+x(step-1);
        y(step) = 1/2*h*(yk1+yko) + y(step-1);
        t(step) = tnew;
        h = h*hraise;
        % accept the step if the error is low enough. Raise h and
        % incremement step.
        if h > hbig
            h = hbig;
        end
    end
end
testneg = y(1:end-1).*y(2:end);
% find values of i where y(i)*y(i+1) is negative, meaning they have
% opposite signs and y has crossed 0.
index = find(testneg<0);
% find indices where y crosses 0
slopes = (y(index)-y(index+1))./(t(index)-t(index+1));
% find the slopes across selected indices
index = index(slopes<0);
slopes = slopes(slopes<0);
% reject slopes and indices where y goes from negative to positive
yzeros = t(index) + -1*y(index)./slopes;
% calculate the times at which y is 0
periods = yzeros - [0 yzeros(1:end-1)];
avgper = sum(periods)/length(periods);
errper = abs(avgper - 2*pi);
% calculate periods, avg periods, and error in the periods. 

xv = [t',x'];
yv = [t',y'];
xy = [x',y'];
per = [(1:length(periods))',periods'];
nsteps = step-1;
raccept = 2*nsteps/count;
save('x.dat','xv')
save('y.dat','yv')
save('xy.dat','xy')
save('per.dat','per')
% define the output variables the lab asks for, and save them. 
format long
disp(errper)
disp(count)
disp(raccept)

figure(1)
plot(t,x,'color','black')
hold on
plot(t,y,'color','red')
title('x(t) and y(t) for e = 0.0000001')
xlabel('time (s)')
ylabel('amplitude')
xlim([-1,31])
ylim([-1.1,1.1])
legend('x(t)','y(t)')

figure(2)
plot(x,y)
title('Phase Plot for e = 0.0000001')
xlabel('x')
ylabel('y')
xlim([-1.4,1.4])
ylim([-1.4,1.4])
        

