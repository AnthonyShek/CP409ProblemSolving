clear all

t_end = 100; % mins
dt = 1; % incre mins
h0 = 10; % init height
h(1,1) = h0; 
h(2,1) = h0; % row 2: altered to negate viscosity influence
t(1) = 0;

rho = 1000; % Density of fluid
mu = 0.001; % viscosity of fluid
g = 9.8; 
A = 1; % Cross-sec area of tank
L = 1; % Length of drainage pipe
D = 0.5; % Diameter of pipe
k = 1e7; % Analysis constant
k_alt = 1e2; % Analysis constant of altered diffeq

tau = rho*g*D^4/k/L/mu/A;
tau_alt = 1/A*sqrt(g*D^4/k_alt); 


% Euler's method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 2:t_end/dt
    dhdt(1) = -tau*h(1,i-1);
    dhdt(2) = -tau_alt*sqrt(h(2,i-1));
    for j = 1:2
        h(j,i) = h(j,i-1) + dhdt(j)*dt;
    end
    t(i) = t(i-1)+dt;
end


% Analytical method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hA(1,:) = h0 .* exp(-tau.*t);
hA(2,:) = (sqrt(h0)-tau_alt.*t./2).^2;


% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lspec = ['r' ':' ; 'b' ':'];
for i = 1:2
    plot(t, hA(i,:), lspec(i,1), t, h(i,:), lspec(i,2) );
    hold on
end

xlabel('Time')
ylabel('Height of Water in Tank')
legend('norm analytical','norm euler','alt analytical',  'alt euler')
ylim([0 h0])
hold off




