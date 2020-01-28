function xeplus = navettediscrete(N, xs, At, Bt, ts)

u=0.05*(N*ts>=1)
%heaviside(N*ts-1);

xeplus = At*xs + Bt*u;

end