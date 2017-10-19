Hours=[0, .5, 1.5, 3];
B=[8.02, 7, 5.03, 3.17];

plot(Hours, B, '-ko')
%axis([0 7 0 10]) %change the axis
%legend('Averages', 'location', 'southeast')
title('Bacterial behavior with Ampicillin')
xlabel('Hours')
ylabel('Log CFU/ml')