%% Calls

Q1b;

%% Code

% Setup
sample = [ whole.sample.(index{2}); whole.sample.(index{3}) ]';
correlation = zeros(2, 1);

% Compute
correlation(1) = corr(sample(:, 1), sample(:, 2));

% Plot
scatter(sample(:, 1), sample(:, 2));

%% Clear workspace

clearvars -except whole index correlation;
