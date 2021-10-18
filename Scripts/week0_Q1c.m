
[t, CA] = ode45(@func, [0 10], 10);
plot(t, CA);

function dCAdt =func(t, CA)
    k = 1;
    dCAdt = -k * CA;
end