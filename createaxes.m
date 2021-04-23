function createaxes(Parent1, Y1)
%CREATEAXES(Parent1, Y1)
%  PARENT1:  axes parent
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 17-Jan-2021 21:59:33

% Create axes
axes1 = axes('Parent',Parent1,...
    'Position',[0.13 0.151291512915129 0.456979166666667 0.773708487084866]);
hold(axes1,'on');

% Create plot
plot(Y1);

% Create ylabel
ylabel('Accuracy');

% Create xlabel
xlabel('Feature Size (Changed using PCA)');

% Create title
title('Accuracy of Testing Data for Reduced Features from 1-39');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',14,'XGrid','on','XMinorTick','on','XTickLabel',...
    {'0','5','10','15','20','25','30','35','40'},'YGrid','on');