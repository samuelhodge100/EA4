function rp = rhsSIR(t,r)
global alpha beta s0
rp = alpha*(1-r- s0*exp(-beta/alpha*r));
end