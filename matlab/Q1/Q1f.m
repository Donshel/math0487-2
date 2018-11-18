%% Calls

loadData;

%% Compute

correlation = corr(dataset.(index{1}), dataset.(index{2}));

%% Display

disp(correlation);

%% Plot

scatter(dataset.(index{1}), dataset.(index{2}));
daspect([1 1 1]);

%% Clear workspace

clearvars -except dataset index correlation;
