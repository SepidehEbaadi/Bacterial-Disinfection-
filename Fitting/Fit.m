function S = Fit(p)
% computation of an error function for an ODE model
% INPUT: p - vector of parameters
global tdata xdata IC tdataA xdataA ICA
%%%%%%%%%%%%%Fit Growth Curve---------------------
function dB = BacterialGrowth(~,B)
%p(1)=.517; %m
D = 0*.1/50; 
%S0 = .1; 
%Y = 10000000; 
%p(9)= 0.2; %ka
%p(7)=.0015; %k_sp: S to P,
%p(8)= .09;  %k_ps: P to S,
%p(2) = .1; %k_st: S to T,
%p(3)= .01; %k_pt: P to T, 
%p(4)= .1; %k_ts: T to S,
%p(5) = .6; %k_tp: T to P,
%p(10)=kd = 0;  %kd: death,
%p(6)=.07; %Y
dB = zeros(4,1);
dB(1) = ((1-0*p(10))*((p(1)*B(4))/p(9)+B(4)))*B(1)-p(2)*(1-(p(1)*B(4)/(p(9)+B(4))))*B(1)-p(7)*B(1)+p(8)*B(3)+p(4)*((p(1)*B(4))/(p(9)+B(4)))*B(2);
dB(2) = p(2)*(1-(p(1)*B(4)/(p(9)+B(4))))*B(1)+p(3)*B(3)-p(5)*B(2)-p(4)*((p(1)*B(4))/(p(9)+B(4)))*B(2);
dB(3) = -(p(8)+D+p(3))*B(3)+p(7)*B(1)+p(5)*B(2);
dB(4) = -(((p(1)/p(6))*B(4))/(p(9)+B(4)))*B(1);
end
%--------------------------------------------------------------
%%%%%%%%%%%%%Fit killing Curve --------------------------------
function dB = BacterialGrowthA(~,B)
%p(1)=.517; %m
D = 0*.1/50; 
%S0 = .1; 
%Y = 10000000; 
%p(9)= 0.2; %ka
%p(7)=.0015; %k_sp: S to P,
%p(8)= .09;  %k_ps: P to S,
%p(2) = .1; %k_st: S to T,
%p(3)= .01; %k_pt: P to T, 
%p(4)= .1; %k_ts: T to S,
%p(5) = .6; %k_tp: T to P,
%p(10)=kd = 0;  %kd: death,
%p(6)=.07; %Y
dB = zeros(4,1);
dB(1) = ((1-p(10))*((p(1)*B(4))/p(9)+B(4)))*B(1)-p(2)*(1-(p(1)*B(4)/(p(9)+B(4))))*B(1)-p(7)*B(1)+0*p(8)*B(3)+p(4)*((p(1)*B(4))/(p(9)+B(4)))*B(2);
dB(2) = p(2)*(1-(p(1)*B(4)/(p(9)+B(4))))*B(1)+0*p(3)*B(3)-p(5)*B(2)-p(4)*((p(1)*B(4))/(p(9)+B(4)))*B(2);
dB(3) = -(0*p(8)+D+0*p(3))*B(3)+p(7)*B(1)+p(5)*B(2);
dB(4) = -(((p(1)/p(6))*B(4))/(p(9)+B(4)))*B(1);
end
%-----------------------------------------------------
tspan = [0:0.1:max(tdata)];
[tsol,xsol] = ode45(@BacterialGrowth,tspan,[IC(1:3);p(11)]);
%[tsol,xsol] = ode45(@BacterialGrowth,tspan,IC);
figure(1)
%To drow error bars-----------------------------
Hours=1:6;
Trial1=[6.017, 6.857, 8.447, 8.681, 9, 10.301];
Trial2=[6, 6.832, 8.025, 7.643, 8.869, 7.892];
Trial3=[6.531, 7.716, 6.602, 7.287, 7.792, 8.365];
A = [Trial1;Trial2;Trial3];
Mean = mean(A);
STD = std(A); %standard deviation
STDE = STD/sqrt(3); %standard error, 3 is the number of trials
errorbar(Hours, Mean, STDE, 'ko','LineWidth',2, 'MarkerSize',10)
%plot(tdata,xdata,'x','MarkerSize',10);
title('Bacterial Growth');
hold on
plot(tsol,xsol(:,1)+xsol(:,2)+xsol(:,3),'LineWidth',3);
legend('Bacterial Growth(Data)','Bacterial Growth(numerics)','location', 'southeast');
xlabel('Hours');
ylabel('Log CFU/ml');
hold off
drawnow
%----------------------------------------------------
ICA = interp1(tsol,xsol,3);
%ICA=ICA+abs(sum(ICA(1:3))-8.3053)/3;
% find predicted values x(tdata)
xpred = interp1(tsol,xsol(:,1)+xsol(:,2)+xsol(:,3),tdata);
%% compute total error
S1 = 0;
for i = 2:length(tdata)
 S1 = S1 + (xpred(i)-xdata(i))^2;
end
% %%%%%%%%%%%%%%% FOR PERSISTERS%%%%%%%%%%%%%%%%%%%%%%%%%
tspanA = [0:0.1:max(tdataA)];
[tsolA,xsolA] = ode45(@BacterialGrowthA,tspanA,ICA);
figure(2)
%plot error bars--------------------------------
HoursA=[0 .5 1.5 3];
Trial1A=[8.18, 7.38, 4.86, 3.08];
Trial2A=[8.02, 7, 5.03, 3.17];
Trial3A=[8.716, 8.380, 8.152, 8.511];
AA = [Trial1A;Trial2A;Trial3A];
MeanA = mean(AA);
STDA = std(AA); %standard deviation
STDEA = STDA/sqrt(3); %standard error, 3 is the number of trials
errorbar(HoursA, MeanA, STDEA, 'ko','LineWidth',2, 'MarkerSize',10)
%plot(tdataA,xdataA,'x','MarkerSize',10);
title('Bacterial Decay');
hold on
plot(tsolA,xsolA(:,1)+xsolA(:,2)+xsolA(:,3),'LineWidth',3);
legend('Bacterial Decay(Data)','Bacterial Decay(numerics)','location', 'northeast');
xlabel('Hours');
ylabel('Log CFU/ml');
hold off
drawnow
% find predicted values x(tdata)
xpredA = interp1(tsolA,xsolA(:,1)+xsolA(:,2)+xsolA(:,3),tdataA);
% compute total error
S2 = 0;
for i = 1:length(tdataA)
 S2 = S2 + (xpredA(i)-xdataA(i))^2;
end

 S = S1 + S2;
end

