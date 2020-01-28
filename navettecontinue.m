function xpoint = navettecontinue(t, x, A, B)

u=0.05*heaviside(t-1);

xpoint= A*x + B*u;

end