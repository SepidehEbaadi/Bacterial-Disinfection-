Hours=[0, 3, 6, 9, 12];
BnoA=[6.44, 8.15, 9.76, 9.27, 9.60];
BwithA=[3.30, 3.51, 7.99, 8.23, 9.11]
plot (Hours, BnoA, '--ro', Hours, BwithA, '-ko','LineWidth',2, 'MarkerSize',10)
xlim([-.1,13]) %Set limits to axis
ylim([0,11]) %Set limits to axis
legend('Bacterial Growth Without A','Persisters Growth With A','location', 'southeast')
title('Bacterial Behavior')
xlabel('Hours')
ylabel('Log CFU/ml')