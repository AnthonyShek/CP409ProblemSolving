clear all

t_end = 6000; % s
dt = 0.1; % incre s
Tinf = 15; % init temp
T(1) = Tinf; 
Tb(1) = 90;
t(1) = 0;
Tbody = 37;

cp = 1000; % J/kg/K
cpw = 4200; % J/kg/K
k = 0.025; % W/m/K
A = 2*0.4*2; % m2

Q0 = 100; % W
Tb0 = 90; % C

x= k*A*(Tbody-Tinf)/Q0; % m

rho = 1.2;
m= rho*A*x;

tau = cp*m*x/k/A/2;

% Euler's method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 2:t_end/dt
    dTbdt = -Q0/cpw/m/(Tb0-Tinf)*(Tb(i-1)-T(i-1));
    Tb(i) = Tb(i-1) + dTbdt*dt;
    
    Q = Q0*(Tb(i)-T(i-1))/(Tb0-Tinf);
    K=x*Q/k/A+Tinf;

    dTdt = K/tau-T(i-1)/tau;
    T(i) = T(i-1) + dTdt*dt;
    t(i) = t(i-1)+dt;
end


% Analytical method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(t, T);
hold on
plot(t, Tb);

xlabel('Time')
ylabel('Temp inside sleeping bag')
legend('T bag','T bottle')
ylim([0 Tb(1)])
hold off




