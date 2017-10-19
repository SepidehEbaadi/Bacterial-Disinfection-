clear all;
close all;
clc;
%close all;
figure
B_plot = [];
B_s0=0;
B_t0=4;
B_p0=2.0006;
S0=0.2828188528; %one of the parameters p(11)
Tfinal = 6; % hours
time_period = [0 Tfinal];
IC=[B_s0;B_t0;B_p0;S0];
[t,B] = ode45('RHSGrowth',time_period,IC);



[ax,h]=plot2axes (t,B(:,1),':k',t,B(:,2),'-.k',t,B(:,3),'k--',t,B(:,4),'k', 'LineWidth',3);

%xlim([-1,7]) %Set limits to axis
ylim([-1,10]) %Set limits to axis
legend('Susceptible', 'Stationary', 'Persisters', 'Nutrient','location', 'northwest')
title('Bacterial Behavior')
xlabel('Hours')
ylabel(ax(1),'Log CFU/ml')
ylabel(ax(2), 'Nutrient(ml)'); 
%Find R^2 for growth 
%The values of numerics at T=1..6, B_1+...+B_3:
%F=[2.6313+4.0841,2.5733+4.7616,2.4554+5.3837, 2.3063+5.9380,2.1467+6.4224, 1.9892+6.8412]
%And we have Mean then [r2 rmse] = rsquare(Mean, F,false), if I don't have
%false I get .89, with false I get .99

%R^2 for Persisters:
%F=[ 3.2549    5.0177    7.1504    8.3366    9.0042], D=[3.3000    4.2151
%7.9900    8.2300    9.1100],
%R^2= .95, r^2 false= .99
