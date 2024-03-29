clear all

t_end = 60; % s
dt = 0.1; % incre s
Tinf = 0; % init temp
T(1) = Tinf; 
t(1) = 0;
Tb = 37;

cp = 1000; % J/kg/K
k = 0.025; % W/m/K
A = 2*0.4*2; % m2
Q = 100; % W

x= k*A*(Tb-Tinf)/Q; % m

rho = 1.2;
m= rho*A*x;

tau = cp*m*x/k/A/2;
K=x*Q/k/A+Tinf;

% Euler's method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 2:t_end/dt
    dTdt = K/tau-T(i-1)/tau;
    T(i) = T(i-1) + dTdt*dt;
    t(i) = t(i-1)+dt;
end


% Analytical method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TA = K - (K-Tinf).*exp(-t./tau);


% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(t, T);
hold on
plot(t, TA);

xlabel('Time')
ylabel('Temp inside sleeping bag')
legend('T euler','T Analytical')
ylim([0 Tb])
hold off




