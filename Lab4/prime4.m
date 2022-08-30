function Y = prime4(t,X)
global count mu 
Y(1) = X(2);
Y(2) = -mu*(X(1)^2-1)*X(2)-X(1);
Y = Y';
count = count + 1;
end