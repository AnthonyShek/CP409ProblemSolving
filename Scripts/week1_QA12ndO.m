clear all

t_end = 1000; % mins
dt = 0.1; % incre mins
CC_e(1) = 0;
t(1) = 0;

for i = 2:t_end/dt
    CC_e(i) = CC_e(i-1) + func_e(CC_e(i-1))*dt;
    t(i) = t(i-1)+dt;
end

Q = 6;
N = 3;
x = 0.05;
V = 30000; 
k = 0.1;

phi = sqrt(Q*N*x/(V*k));
C_eA = phi*(exp(2*phi*t*k)-1)./(1+exp(2*phi*t*k));


plot(t, CC_e);
xlabel('time (min)')
ylabel('Concentration (L CO2 per V capsule)')
hold on
plot(t, C_eA)
hold off
legend('part e: Euler', 'part e: Analytical')

function dCdt_e =func_e(C)
    Q = 6; %rate air consumption per person per min (6L_air per person per min)
    N = 3; % number of people
    x = 0.05; % composition of CO2 of exhaled air
    V = 30000; % volume of capsule
    k = 0.1; % arbitrary rate constant
    order = 2; % reaction order

    dCdt_e = Q * N * x / V - k * C^order;
end