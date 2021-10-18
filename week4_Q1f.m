clear all

t_end = 4;
dt = 0.001;

k = 1; %analysis constant
va = 20; % average air velocity m/s
D = 0.01; % diameter of balloon aperture m
circum_0 = 0.725; % init. circumference m
Cd = 1; % drag coeff
Q = 0.0016; %  average vol. flowrate m3/s
m0 = 0.004; % mass of balloon
rho = 1.22; % density of air

V0 = (circum_0 /pi)^3 * pi / 6; % init. balloon vol

t = linspace(0, t_end, t_end/dt);
vb_a = sqrt(2.*k.*va^2.*D^2./Cd./(V0-Q.*t).^(2/3));

%vb_e(1) = 0;
vb_e2(1) = 0; % corrected to include dm/dt term

for i = 2:t_end/dt
%    dvdt = (k*va^2*D^2*rho-0.5*rho*Cd*(V0-Q*t(i-1)^(2/3))*vb_e(i-1)^2)/(m0+rho*(V0-Q*t(i-1)));
    dvdt2 = (k*va^2*D^2+0.25*va*vb_e2(i-1)*D^2-0.5*Cd*(V0-Q*t(i-1)^(2/3))*vb_e2(i-1)^2)/(m0/rho+(V0-Q*t(i-1)));
%    vb_e(i) = vb_e(i-1) + dvdt*dt;
    vb_e2(i) = vb_e2(i-1) + dvdt2*dt;
end
plot(t,vb_a, 'r-', t, vb_e2, 'b-')
ylabel('velocity')
xlabel('time')
legend('Analytical', 'Eulers')