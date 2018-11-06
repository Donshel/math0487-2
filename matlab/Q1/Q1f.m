%% Calls

run('..\scripts\addPath');
loadWhole;

%% Code

% Compute
correlation = corr(dataset.(index{1}), dataset.(index{2}));

% Plot
scatter(dataset.(index{1}), dataset.(index{2}));

%% Clear workspace

clearvars -except whole index correlation;
