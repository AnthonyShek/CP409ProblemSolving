clear all

t_end = 500; % mins
dt = 0.1; % incre mins
CC_d(1) = 0;
t(1) = 0;

%Euler's method
for i = 2:t_end/dt
    CC_d(i) = CC_d(i-1) + func_d(CC_d(i-1))*dt;
    t(i) = t(i-1)+dt;
end

plot(t, CC_d);
xlabel('time (min)')
ylabel('Concentration (L CO2 per V capsule)')

% Analytical Solution
Q = 6; 
N = 3; 
x = 0.05; 
V = 30000; 
k = 0.1; 
tau = Q * N * x / V;
C_dA = -tau/k.*(1./exp(k.*t)-1);

hold on
plot(t, C_dA)
hold off
legend('part d: Euler', 'part d: Analytical')

function dCdt_d =func_d(C)
    Q = 6; %rate air consumption per person per min (6L_air per person per min)
    N = 3; % number of people
    x = 0.05; % composition of CO2 of exhaled air
    V = 30000; % volume of capsule Litres
    k = 0.1; % arbitrary rate constant
    order = 1; % reaction order

    dCdt_d = Q * N * x / V - k * C^order;
end



% [t, C] = ode45(@func, [0 t_end], 0);
% [t, C] = ode45(@func2, [0 t_end], 0);

% hold on
% plot(t, CC_e);
% legend('part d: First order', 'part e: Second order')
% hold off


