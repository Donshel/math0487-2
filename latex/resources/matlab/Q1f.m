%% Calls

loadData;

%% Compute

% Setup
tab = table;

% Compute
tab.correlation = corr(dataset.(index{1}), dataset.(index{2}));

%% Display

disp(tab);

%% Plot

scatter(dataset.(index{1}), dataset.(index{2}));
xlabel((index{1}));
ylabel((index{2}));
daspect([1 1 1]);

%% Clear workspace

clearvars -except dataset index tab;
