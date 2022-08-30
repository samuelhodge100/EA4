global beta count m k
c = input('1 or 2: ');
%% beta = 0.25
if c == 1
    [m,k,beta,h,hbig,hsmall,hcut,hraise,e,yinit,tfin,tinit] = readvars('/Users/samuelhodge/Desktop/Northwestern/Fall Quarter (Sophomore)/EA4/Lab#3 Soft vs Hard Spring System/lab 3/EA4_task5.xlsx','range','A1');
    A = (1:30) * .1;
    period = zeros(1,30);
    for i = A
        t = [tinit];
        x = [i];
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
        % calculate periods, avg periods, and error in the periods.
        period(floor(10*i)) = avgper;
        if i == 1
            x1 = x;
            y1 = y;
        elseif i == 2
            x2 = x;
            y2 = y;
        elseif i == 3
            t3 = t;
            x3 = x;
            y3 = y;
        end
    end
    % period vs approximated plots
    gamma = beta*A.*A;
    T2 = 2*pi*(1-3*gamma/8);
    T3 = 2*pi*(1-3/8*gamma + 57/265*gamma.*gamma);
    plot(A,period,'color','black')
    hold on
    plot(A,T2,'color','blue')
    plot(A,T3,'color','red')
    title('computed periods vs approximations')
    xlabel('Initial Displacement A')
    ylabel('period (s)')
    legend('computed','T2','T3')
    ylim([0 8.2])
    
    figure(2)
    % period vs approx plots
    plot(t3,x3,'color','blue')
    hold on
    plot(t3,y3,'color','red')
    title('x and y over time for A = 3 and beta = 0.25')
    xlabel('time (s)')
    ylabel('amplitude')
    legend('x','y')
    
    figure(3)
    % period vs approx plots
    plot(x1,y1,'color','black')
    hold on
    plot(x2,y2,'color','red')
    plot(x3,y3,'color','blue')
    title('phase plots for A = 1,2,3 and beta = 0.25')
    xlabel('x')
    ylabel('y')
    legend('A = 1','A = 2','A = 3')
else
    %% beta = -0.25
    [m,k,beta,h,hbig,hsmall,hcut,hraise,e,yinit,tfin,tinit] = readvars('/Users/samuelhodge/Desktop/EA4/Lab#3/lab 3/EA4_task5pt2.xlsx','range','A1');
    A = [1:19 21]*.1;
    period = zeros(1,20);
    for i = A
        t = [tinit];
        x = [i];
        y = [yinit];
        step = 1;
        count = 0;
        if i == 2.1
            tfin = 2.5;
        end
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
            xhigh = x(step) + h*xk1;
            yhigh = y(step) + h*yk1;
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
        % calculate periods, avg periods, and error in the periods.
        period(floor(10*i)) = avgper;
        if i == 1.5
            x15 = x;
            y15 = y;
        elseif i == 1.6
            x16 = x;
            y16 = y;
            % matlab did not accept 1.7000 = 1.7, floor rectified that
        elseif floor(10*i)/10 == 1.7
            x17 = x;
            y17 = y;
        elseif i == 1.8
            x18 = x;
            y18 = y;
            % same as above
        elseif floor(10*i)/10 == 1.9
            x19 = x;
            y19 = y;
            t19 = t;
        elseif i == 2.1
            x21 = x;
            y21 = y;
        end
    end
    period = period([1:19,21]);
    % have to get rid of an extra period assignment from the for loop 
    % plots for approximated periods
    gamma = beta*A.*A;
    T2 = 2*pi*(1-3*gamma/8);
    T3 = 2*pi*(1-3/8*gamma + 57/265*gamma.*gamma);
    plot(A(1:end-1),period(1:end-1),'color','black')
    hold on
    % end -1 because I do not want to include A = 2.1 in this plot
    plot(A(1:end-1),T2(1:end-1),'color','blue')
    plot(A(1:end-1),T3(1:end-1),'color','red')
    title('computed periods vs approximations')
    xlabel('A')
    ylabel('period (s)')
    legend('computed','T2','T3')
    
    figure(2)
    % time plot for A = 1.9
    plot(t19,x19,'color','blue')
    hold on
    plot(t19,y19,'color','red')
    title('x and y over time for A = 1.9 and beta = -0.25')
    xlabel('time (s)')
    ylabel('amplitude')
    legend('x','y')
    
    figure(3)
    % phase plots for 1.5-2.1
    plot(x15,y15,'color','red')
    hold on
    plot(x16,y16,'color','blue')
    plot(x17,y17,'color','black')
    plot(x18,y18,'color','green')
    plot(x19,y19,'color','cyan')
    plot(x21,y21,'color','magenta')
    title('phase plots for A = 1.5 through 2.1, beta = -0.25')
    xlabel('x')
    ylabel('y')
    legend('A = 1.5','A = 1.6','A = 1.7','A = 1.8','A = 1.9','A = 2.1')

    
end
        

