clear all
close all
clc
tic
w0 = 2;
G = 1;
ts = 0.05;
tinitial=0;
tfinal=8;

Ninitial=tinitial/ts;
Nfinal=tfinal/ts;

x0=[0;0];
num = [w0*w0*G];
den = [1 0 4];
A = [0 1; -4 0];
B = [0 ; 4];
C = [1, 0];
D = 0;

sys = tf(num, den);
[numd,dend] = tfdata(sys,'v');

%sysd = c2d(sys, ts, 'zoh')

sysnew = ss(A, B, C, D);
sysdnew = c2d(sysnew, ts);
[atilde, btilde] = ssdata(sysdnew);

[T, X] = ode45(@(t,x)navettecontinue(t,x,A,B),[tinitial,tfinal],x0);
[N, Xs] = ore(@(n,xs)navettediscrete(n,xs,atilde,btilde, ts),[Ninitial,floor(Nfinal)],x0);
alpha=X*C' + 0.3;
plot(T,alpha)
hold on
plot(N*ts,Xs*C'+0.3,'ro')
toc
KI = 2.70 %Nm/rad s
KD = 0.75 %Nm/rad
KP = 1.25 %Nms/rad
alpha_nom = 0.3 %rad
Tpwm = 0.02 %s
E = 0.05 %Nm