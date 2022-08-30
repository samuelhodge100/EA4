global a b count
% Making the variables a b and count usable across different files.
[a,b,pinit,tfin,tol1,tol2,tol3] = readvars('/Users/samuelhodge/Desktop/Northwestern/Fall Quarter (Sophomore)/EA4/Lab#1/testfile.xlsx','range','A1');
% this was a local file for testing 
% Pulling variable values from a excel file

count = 0;
close all;

%Set the tolerance level at which the ode45 will compute the solution
%Lower tolerences mean a more accurate solution
options = odeset('RelTol',tol1,'AbsTol',tol1);


[t,P1] = ode45(@yprime, [0,tfin], pinit,options);

plot(t,P1,'color','black','LineWidth',1)
hold on;
%Count = 391 (Lowest level of computational power required)



options = odeset('RelTol',tol2,'AbsTol',tol2);
[t,P2] = ode45(@yprime, [0,tfin], pinit,options);

plot(t,P2,'color','red','LineWidth',0.25)
hold on;
%Count = 409  (Slightly more computational power required)



options = odeset('RelTol',tol3,'AbsTol',tol3);
[t,P3] = ode45(@yprime, [0,tfin], pinit,options);

plot(t,P3,'color','green','LineWidth',0.25)
hold on;
%Count = 457   (Most computational power required but most accurate
%solution)


%Setting labels, legends, and limits on the graph
xlim([-1,101]);
ylim([2.399,2.417]);

ylabel('Population');
xlabel('Time');
title('Population vs Time');
legend('Tolerance = 10^-^3','Tolerance = 10^-^5','Tolerance = 10^-^7');

%When the default tolerance is used, the graph looks like an occilating
%function and does not resemble the graph of the typical solution found in
%figure 2.1.2 in the textbook.  The typical solution is not 
%ocillating.  The fuction occilates because relatively large tolerance used
%means a greater level of error in the solution.


% Count for tol1 = 391 (Lowest level of computational power required)
% Count for tol2 = 409 (Slightly more computational power required)
% Count for tol3 = 457 (Most computational power required but most accurate
% solution)

% The count for each computation is stated in the code above.  Tol3
% requires approximately 14% more computations to get the result compared
% to Tol1.
