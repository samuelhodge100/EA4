function f = yprime(t,p)
    global a b count
%     Makes a b and count global variables

%  Initialize the function
f = p-p^2+(a*p^2)/(1+b*p);

% A counting parameter to measure the computation required
count = count+1;
end

