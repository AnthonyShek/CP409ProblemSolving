CA0 = 2; % Arbitrary value
CC0 = 0;
CC_b = CC0;
t_b(1) = 0;
t_end = 10;
dt = 0.001;

% Euler's Method Solution (part b)_____________________
for i = 2:t_end/dt
    CC_b(i) = CC_b(i-1) + grad(CC_b(i-1), CA0)*dt;
    t_b(i) = t_b(i-1)+dt;
end


% Analytical Solution (part c)______________________
t_c = 0:dt:t_end;
CC_c = CA0 * (1-t_c*exp(CA0-1))./(1-CA0*t_c*exp(CA0-1));

% Plotting _________________________________________
plot(t_b, CC_b)
hold on
plot(t_c, CC_c)
legend("Euler's Method", "Analytical")
hold off

function dCCdt_b = grad(CC, CA0)
    dCCdt_b = (CA0 - CC) * (1 - CC);
end