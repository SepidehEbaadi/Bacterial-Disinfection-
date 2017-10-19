Hours=[0, 1, 1.5, 3];
B=[8.716, 8.380, 8.152, 8.511];

plot(Hours, B, '-ko')
%axis([0 7 0 10]) %change the axis
%legend('Averages', 'location', 'southeast')
title('Bacterial behavior with Ampicillin')
xlabel('Hours')
ylabel('Log CFU/ml')