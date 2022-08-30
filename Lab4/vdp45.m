%% 45
global mu count
[mu,xinit,yinit,tfin,tol] = readvars('/Users/samuelhodge/Desktop/Northwestern/Fall Quarter (Sophomore)/EA4/Lab#4/Run1.xlsx','range','A1');
count = 0;
options = odeset('RelTol',tol);
[t,X] = ode45(@prime4,[0,tfin],[xinit,yinit],options);
xv = [t,X(:,1)];
yv = [t,X(:,2)];
xy = [X(:,1),X(:,2)];
nsteps = length(t);
% save('x.dat','xv')
% save('y.dat','yv')
% save('xy.dat','xy')



% plot(t,xy1(:,1),'color','black')
% hold on
% plot(t,xy(:,2),'color','red')
% fillcirc(0,0,0.1,'blue')
% fillcirc(xy1(1,1),xy1(1,2),0.05,'black')
% fillcirc(xy(1),xy(1,2),0.05,'red')
% title('y(t) and x(t) over time (mu = 500)')
% legend('x init = 1','x init = 3','critical point')
% xlabel('x')
% ylabel('y')
% xlim([2000,5000])
% ylim([-900,900])

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


% 
% function [] = fillcirc(x,y,r,color)
% t = 0:0.01:2*pi;
% xc = x + r*cos(t);
% yc = y + r*sin(t);
% fill(xc,yc,color)
% end




