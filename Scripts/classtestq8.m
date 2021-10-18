clear all

t_end = 100; % mins
dt = 0.1; % incre mins
v(1) = 0;
t(1) = 0;

dist = 0;

%Euler's method
for i = 2:t_end/dt
    v(i) = v(i-1) + func(v(i-1))*dt;
    dist = dist + v(i)*dt;
    t(i) = t(i-1)+dt;
end

plot(t, v, 'b--');
xlabel('time')
ylabel('Velocity')
legend('Euler')

fprintf('Distance travelled: %s units \n',dist);

function dvdt =func(v)
    dvdt = 1-v^3;
end
