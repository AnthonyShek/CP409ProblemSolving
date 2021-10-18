clear all

t_end = 100; % mins
dt = 0.1; % incre mins
v(1) = 0;
t(1) = 0;

%Euler's method
for i = 2:t_end/dt
    v(i) = v(i-1) + func(v(i-1))*dt;
    t(i) = t(i-1)+dt;
end

plot(t, v, 'b--');
xlabel('time')
ylabel('Velocity')

% Analytical Solution
k = 100;
D = 0.5;
mu = 0.001;
m = 1;
rhof = 1000;
rhos = 2000;
g = 9.8;

tau = g*m*(1-rhof/rhos)/k/D/mu;
phi = k*D*mu/m;

v_a = tau.*(1-exp(-phi.*t));

hold on
plot(t, v_a, 'r')
hold off
legend('Euler', 'Analytical')

function dvdt =func(v)
    k = 100; % dimensional analysis constant
    D = 0.5; % diameter of sphere
    mu = 0.001; % viscosity of fluid
    m = 1; % mass of falling sphere
    rhof = 1000; % density of fluid
    rhos = 2000;% density of sphere
    g = 9.8;

    dvdt = -k*D*mu*v/m + g*(1- rhof/rhos);
end
