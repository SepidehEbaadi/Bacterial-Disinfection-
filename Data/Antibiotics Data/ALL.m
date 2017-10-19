Hours=[0, 0.5, 1.5, 3];
Trial1=[8.716, -0.34, -0.56, -0.2];
Trial2=[8.18, -0.8, -3.32, -5.1];
Trial3=[8.18, -1.02, -2.99, -4.85];

A = [Trial1;Trial2;Trial3]
Mean = mean(A)
STD = std(A) %standard deviation
STDE = STD/sqrt(3) %standard error, 3 is the number of trials
%plot with error bars
errorbar(Hours, Mean, STDE, '-ko','LineWidth',2, 'MarkerSize',10)
%ylim([-5,10]) %Set limits to axis
set(gca,'YTick', -5:1:10) % Adds more points to axis
legend('Averages', 'location', 'northeast')
title('Bacterial survival after Ampicillin')
xlabel('Hours')
ylabel('Log % survival')

% Create a table 
T = table(transpose(Hours),transpose( Trial1),transpose( Trial2),transpose( Trial3),transpose( Mean),transpose( STD),transpose( STDE), 'VariableNames',{'Hours' 'Trial1' 'Trial2' 'Trial3' 'Mean' 'STD' 'STDE'})

% ***********The data for 3 experiments: 
% A=  8.7160    8.3800    8.1520    8.5110
%     8.1800    7.3800    4.8600    3.0800
%     8.0200    7.0000    5.0300    3.1700
% mean=  8.3053    7.5867    6.0140    4.9203