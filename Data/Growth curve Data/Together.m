Hours=1:6;
Trial1=[6.017, 6.857, 8.447, 8.681, 9, 10.301];
Trial2=[6, 6.832, 8.025, 7.643, 8.869, 7.892];
Trial3=[6.531, 7.716, 6.602, 7.287, 7.792, 8.365];

A = [Trial1;Trial2;Trial3]
Mean = mean(A)
STD = std(A) %standard deviation
STDE = STD/sqrt(3) %standard error, 3 is the number of trials
%plot with error bars
errorbar(Hours, Mean, STDE, '-ko','LineWidth',2, 'MarkerSize',10)
axis([0 7 0 10]) %change the axis
legend('Averages', 'location', 'southeast')
title('Bacterial Growth')
xlabel('Hours')
ylabel('Log CFU/ml')

% Create a table 
T = table(transpose(Hours),transpose( Trial1),transpose( Trial2),transpose( Trial3),transpose( Mean),transpose( STD),transpose( STDE), 'VariableNames',{'Hours' 'Trial1' 'Trial2' 'Trial3' 'Mean' 'STD' 'STDE'})
