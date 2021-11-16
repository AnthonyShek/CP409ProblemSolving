clear all

t_end = 1e3; % s
dt = 0.1; % incre s
Ti = 0; % C
D(1) = 0.04; % m
Tw(1) = 15; % C
t(1) = 0;

cpw = 4200; % J/kg/C
H = 3.34e5; % J/kg
rhoi = 917; % kg/m3
m0 = 0.3; % kg init. mass water

h = D(1)*H*rhoi/(2*(Tw(1)-Ti)*10*60); % W/m2/C

% Euler's method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 2:t_end/dt
    dDdt = 2*h/(H*rhoi)*(Ti-Tw(i-1));
    D(i) = D(i-1) + dDdt*dt;
    
    A = pi*D(i)^2;
    mw = m0 + rhoi*pi/6*(D(1)-D(i))^3;

    dTwdt = h*A/(cpw*mw)*(Ti-Tw(i-1));
    Tw(i) = Tw(i-1) + dTwdt*dt;
    t(i) = t(i-1)+dt;
end



% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tiledlayout(2,1);
nexttile
plot(t, Tw);
xlabel('Time')
ylabel('Temp of water')

nexttile
plot(t, D);
xlabel('Time')
ylabel('Ice cube diameter')

hold off




