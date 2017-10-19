Hours=[0, .5, 1.5, 3];
P=[8.18, -0.8, -3.32, -5.1];

plot(Hours, P, '-ko')
%axis([0 7 0 10]) %change the axis
%legend('Averages', 'location', 'southeast')
title('Bacterial survival after Ampicillin')
xlabel('Hours')
ylabel('Log % survival')