clear all

t_end = 4;
dt = 0.001;

k = 1; %analysis constant
va = 20; % average air velocity m/s
D = 0.01; % diameter of balloon aperture m
ap = D^2 *pi/4; %area of baloon aperaure m2
circum_0 = 0.725; % init. circumference m
Cd = 1; % drag coeff
Q = 0.0016; %  average vol. flowrate m3/s
m0 = 0.004; % mass of balloon kg
rho = 1.22; % density of air kg/m3

V0 = (circum_0 /pi)^3 * pi / 6; % init. balloon vol m3

t = linspace(0, t_end, t_end/dt);
%vb_a = sqrt(2.*k.*va^2.*D^2./Cd./(V0-Q.*t).^(2/3));


vb(1) = 0;
s = vb*dt;

for i = 2:t_end/dt
    A = (V0-Q*t(i-1))^(2/3);
    m = m0+rho*(V0-Q*t(i-1));
    
    dvbdt = (va^2*ap+va*ap*vb(i-1)-0.5*A*vb(i-1)^2)*rho/m;
    
    vb(i) = vb(i-1) + dvbdt*dt;
    s = s + vb(i)*dt;
end

fprintf('Distance travelled: %s units \n',s);

%plot(t,vb_a, 'r-', t, vb, 'b-')
plot(t, vb)
ylabel('velocity')
xlabel('time')
%legend('Analytical', 'Eulers')