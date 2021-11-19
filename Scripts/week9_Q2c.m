clear all

Ti = 0; % C
Tinf = 8; % C
r(1) = 78.8; % m
t = 2e6;
v = 1; % m/s

P = 1e7; % W
H = 3.34e5; % J/kg
rhoi = 917; % kg/m3
h = 680; % W/m2/C
Cd = 1; 
s = t*v; % m 
Cf = 3.5e7; % J/L fuel
eta = 0.3; % eff. 

tau = h*(Tinf-Ti)/(H*rhoi);
phi = (2*P/(Cd*pi))^(1/3);

ppL = 0.01; % £ per litre
fppL = 0.80; % fuel £ per litre

st = 10;
ed = 100;

r0 = linspace(st,ed,200);

tiledlayout(3,1)
nexttile
for i = 1:3
    
    if i == 2
        t = 30*24*60^2;
        nexttile
    elseif i == 3
        fppL = 1.4;
        nexttile
    end
    
    f_cost = P*t/(Cf*eta)*fppL;
    sales = 4/3.*pi.*((r0.^(1/3)-s*tau/(3*phi)).^3).^3*1000*ppL;
    profits = sales - f_cost;
    
    plot(r0, profits);
    ylabel('Gross Profit [£]')
    xlabel('Initial iceberg radius')
    hold on
    plot([st ed], [0 0])
end
