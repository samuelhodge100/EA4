%% 15
global mu count
[mu,xinit,yinit,tfin,tol] = readvars('/Users/samuelhodge/Desktop/Northwestern/Fall Quarter (Sophomore)/EA4/Lab#4/Run1.xlsx','range','A1');
count = 0;
options = odeset('RelTol',tol);
[t,X] = ode15s(@prime4,[0,tfin],[xinit,yinit],options);
xv = [t,X(:,1)];
yv = [t,X(:,2)];
xy = [X(:,1),X(:,2)];
nsteps = length(t);
% save('x.dat','xv')
% save('y.dat','yv')
% save('xy.dat','xy')

% plot(xy1(:,1),xy1(:,2),'color','black')
figure(1)
hold on

plot(t,xy(:,2),'--','color','red')
plot(t,xy(:,1),'color','black')
plot(xy(:,1),xy(:,2),'color','red')
plot(t,xy(:,2),':','color','blue')
title('Phase Plot for mu = 500')

% Graphing Critical Point
% fillcirc(0,0,0.1,'blue')

%Graphing X Initial
% fillcirc(xy(1),xy(1,2),0.05,'red')
% 
% legend('mu = 500','critical point', 'x init = 1')
% xlim([-5 5])
% ylim([-800 800])
% 
% xlabel('x')
% ylabel('y')
% 
% figure(2)
% hold on
% plot(t,xy(:,1)*200,'--','color','red')
% plot(t,xy(:,2),'color','blue')
% 
% title('x(t) and y(t) with mu = 500')
% legend('x(t)','y(t)')
% xlim([2000 5000])
% ylim([-900 900])
% 
% xlabel('t')
% ylabel('position')
%%Critical Point

figure(2)
% fillcirc(xy1(1,1),xy1(1,2),0.05,'black')
plot(yv2(:,1),yv2(:,2),'--','color','blue')
plot(yv1(:,1),yv1(:,2),':','color','blue')
plot(yv(:,1),yv(:,2),'color','blue')

title('y(t) with mu = 500')
legend('y(t) with tol = 10^-^9', 'y(t) with tol = 10^-^7','y(t) with tol = 10^-^5')
xlabel('t')
ylabel('position')
xlim([2000,5000])
ylim([-900,900])
% figure(2)
% plot(xv1(:,1),xv1(:,2))
% hold on
% plot(xv(:,1),xv(:,2),'--')
% title('x(t) for runs 1 and 2')
% xlabel('time')
% ylabel('position')
% xlim([-1,51])
% 
% figure(3)
% plot(yv1(:,1),yv1(:,2))
% hold on
% plot(yv(:,1),yv(:,2),'--')
% title('y(t) for runs 1 and 2')
% xlabel('time')
% ylabel('velocity')
% xlim([-1,51])


% function [] = fillcirc(x,y,r,color)
% t = 0:0.01:2*pi;
% xc = x + r*cos(t);
% yc = y + 170*r*sin(t);
% fill(xc,yc,color)
% end