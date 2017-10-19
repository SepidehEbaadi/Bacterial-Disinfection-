Hours=[0, 1, 1.5, 3];
P=[8.716, -0.34, -0.56, -0.2];

plot(Hours, P, '-ko')
%axis([0 7 0 10]) %change the axis
%legend('Averages', 'location', 'southeast')
title('Bacterial behavior with Ampicillin')
xlabel('Hours')
ylabel('Log % survival')