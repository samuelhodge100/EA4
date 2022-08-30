function ip = rhsSIS(t,i)
global beta alpha 
ip = beta*i*(1-alpha/beta-i);
end