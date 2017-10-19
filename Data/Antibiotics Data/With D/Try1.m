Hours=[0, .5, 1.5, 3];
B=[8.18, 7.38, 4.86, 3.08];

plot(Hours, B, '-ko')
%axis([0 7 0 10]) %change the axis
%legend('Averages', 'location', 'southeast')
title('Bacterial behavior with Ampicillin')
xlabel('Hours')
ylabel('Log CFU/ml')