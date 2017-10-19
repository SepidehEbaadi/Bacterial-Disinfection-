clear all;
clc;
%close all;
figure
B_plot = [];
B_s0=0;
B_t0=4;
B_p0=2.0006;
S0=0.2828188528; %one of the parameters p(11)
Tfinal = 12; % hours
time_period = [0 Tfinal];
IC=[B_s0;B_t0;B_p0;S0];
[t,B] = ode45('RHSGrowth',time_period,IC);

t_vec=[0 3 6 9 12];
B_help=interp1(t,B,t_vec);
TfinalA = 3; % hours
time_periodA = [0 TfinalA];
for k=1:length(t_vec)
 I_cs= B_help(k,:);
[t_temp,B_temp] = ode45('RHSKilling',time_periodA,I_cs);
 B_plot=[B_plot;B_temp(end,:)];
end

%%%%%%GROWTH%%%%%%%%-------------------
Hours=1:6;
Trial1=[6.017, 6.857, 8.447, 8.681, 9, 10.301];
Trial2=[6, 6.832, 8.025, 7.643, 8.869, 7.892];
Trial3=[6.531, 7.716, 6.602, 7.287, 7.792, 8.365];
A = [Trial1;Trial2;Trial3];
Mean = mean(A);
STD = std(A); %standard deviation
STDE = STD/sqrt(3); %standard error, 3 is the number of trials
%plot with error bars
errorbar(Hours, Mean, STDE, 'k*','LineWidth',2, 'MarkerSize',10)
axis([0 13 2 10]) %change the axis
hold
HoursG=[0, 9, 12];
BnoAG=[6.44, 9.27, 9.60];
plot (HoursG, BnoAG, 's','LineWidth',2,'MarkerSize',10, 'MarkerEdgeColor','k' )
plot (t,B(:,1)+B(:,2)+B(:,3),'k:', 'LineWidth',3)

%%%%PERSISTERS GROWTH%%%%%%%%%-------------------------
  HoursA=[3];
  BwithA=[4.9203,3.51];
  Mean = mean(BwithA);
STD = std(BwithA); %standard deviation
STDE = STD/sqrt(2); %standard error, 2 is the number of trials
%plot with error bars
errorbar(HoursA, Mean, STDE, 'ko','LineWidth',2,'MarkerSize',10 )
HoursA2=[0, 6, 9, 12];
BwithA2=[3.30, 7.99, 8.23, 9.11];
 plot(t_vec,B_plot(:,1)+B_plot(:,2)+B_plot(:,3),'k', 'LineWidth',3)
plot (HoursA2, BwithA2, 's','LineWidth',2,'MarkerSize',10, 'MarkerEdgeColor','k')

%xlim([0,7]) %Set limits to axis
ylim([0,10]) %Set limits to axis
h_legend=legend('Bacterial Growth Without Antibiotic, Models Calibration','Models Validation Data','Bacterial Growth Without Antibiotic, Models Prediction','Persisters Growth With Antibiotic, Models Calibration','Persisters Growth With Antibiotic, Models Prediction','location', 'southeast')
%make legend font bigger:
set(h_legend,'FontSize',12);
h_title=title('Bacterial Behavior')
set(h_title,'FontSize',14);
h_xl=xlabel('Hours');
set(h_xl,'FontSize',14);
h_yl=ylabel('Log CFU/ml');
set(h_yl,'FontSize',14);

%Find R^2 for growth 
%The values of numerics at T=1..6, B_1+...+B_3:
%F=[2.6313+4.0841,2.5733+4.7616,2.4554+5.3837, 2.3063+5.9380,2.1467+6.4224, 1.9892+6.8412]
%And we have Mean then [r2 rmse] = rsquare(Mean, F,false), if I don't have
%false I get .89, with false I get .99

%R^2 for Persisters:
%F=[ 3.2549    5.0177    7.1504    8.3366    9.0042], D=[3.3000    4.2151
%7.9900    8.2300    9.1100],
%R^2= .95, r^2 false= .99
