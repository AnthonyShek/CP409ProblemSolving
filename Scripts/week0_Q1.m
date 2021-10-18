CA0 = 10;
CA_b(1) = CA0;
t_b(1) = 0;
dt = 0.01;
t_end = 10;
k = 1;

% Solution to part b__________________________
for i = 2:t_end/dt
    CA_b(i) = CA_b(i-1) + grad(CA_b(i-1), k)*dt;
    t_b(i) = t_b(i-1)+dt;
end



% Solution to part c____________________________
[t_c, CA_c] = ode45(@func, [0 t_end], CA0);


% Solution to part d(Analytical)_____________________
t_d = 0:dt:t_end;
CA_d = CA0 * exp(-k*t_d);


% Plotting__________________________________
plot(t_b, CA_b)
hold on
plot(t_c, CA_c)
plot(t_d, CA_d)
legend('Eulers Method', 'ode45', 'Analytical')
hold off


% Functions__________________________________
function dCAdt_b = grad(CA, k)
    dCAdt_b = -k * CA;
end

function dCAdt_c =func(t, CA)
    k = 1;
    dCAdt_c = -k * CA;
end