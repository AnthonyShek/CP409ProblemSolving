clear all

t_end = 1e2; % s
dt = 0.1; %2 incre s
t = linspace(0, t_end, t_end/dt);

Cd = 0.4; 
rho = 1000;
A = 80/(rho * 1.78); % assumed projected area if cylindrical swimmer
L = 100;
t0 = 100;
alpha = linspace(-0.01, 0.01, 100);


k = 0.5*Cd*rho*A;
tau = L/t0 - alpha*t0/2;

% trap method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:100
    v = L/t0 + alpha(i)*(-t0/2);
    P1 = k*v^3;

    E(i) = 0;
    for j = 2:t_end/dt
        v = L/t0 + alpha(i)*(t(j)-t0/2);
        P2 = k*v^3;
        trap = 0.5*dt*(P2+P1);
        E(i)= E(i)+trap;
        P1 = P2;
    end
    
end

% Analytical method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ea = k/(4*alpha).*((tau + alpha.*t).^4-tau^4);

% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(alpha, E);
hold on
xlabel('alpha')
ylabel('Energy Expenditure')
hold off
