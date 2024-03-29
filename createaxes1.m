function createaxes1(Parent1, Y1)
%CREATEAXES1(Parent1, Y1)
%  PARENT1:  axes parent
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 17-Jan-2021 22:19:45

% Create axes
axes1 = axes('Parent',Parent1,...
    'Position',[0.103963355834138 0.146538372183073 0.855133795837464 0.771704871060169]);
hold(axes1,'on');

% Create plot
plot(Y1);

% Create ylabel
ylabel('EigenValue');

% Create xlabel
xlabel('Index of Eigenvalue');

% Create title
title('EigenValues from svd of Codebook data');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',14);
