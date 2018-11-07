%% Calls

run('..\scripts\addPath');
loadData;

%% Code

% Compute
correlation = corr(dataset.(index{1}), dataset.(index{2}));

% Plot
scatter(dataset.(index{1}), dataset.(index{2}));

%% Clear workspace

clearvars -except dataset index correlation;
