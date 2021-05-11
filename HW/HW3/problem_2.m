%%%%%%%%%%%%%%%%%
syms T(t)
ode = (Kp + Ks)*T + b*diff(T,t) == Ks*To;

cond = T(0) == 0;
TSol(t) = dsolve(ode, cond)

% To = 1;
% Ks = 300;
% Kp = 200;
% 
% odefunc = @(t,T) (To*Ks - (Ks + Kp)*T)
% tspan =[0 5]/100;
% y0 = 0;
% [t,y] = ode45(odefunc, tspan, y0);
% plot(t,y)

%%%%%%%%%%%%%%%%%%%%
syms s
ks = 300;
b = 1;
kp = 200;
sys = tf(ks, [b, ks+kp]);

t = [0:.1:10]/1000;

u = ones(1,numel(t));
u(t>.005) = 0;
lsim(sys,u,t)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms s
ks = 300;
b = .5;
kp = 100;
sys = tf(ks, [b, ks+kp]);

t = [0:.1:10]/1000;

u = ones(1,numel(t))/10;
u(t>.005) = 0;


Fs = 1e5;
t = 0:1/Fs:250e-3;

pulsewidth = 5e-3;
pulseperiods = [0:4]*50e-3;

x = pulstran(t,pulseperiods,@rectpuls,pulsewidth)/10;

% plot(t,x)



lsim(sys,x,t)