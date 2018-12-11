%% Calls

Q1b;

%% Code

% Setup
val = [data(:).(index{2}); data(:).(index{3})]';

% Compute
corr1 = corr(val(:, 1), val(:, 2));
corr2 = (mean(val(:, 1) .* val(:, 2)) - s(1).mean * s(2).mean) / (s(1).std * s(2).std);

% Plot
scatter(val(:, 1),val(:, 2));

%% Clear workspace

clearvars -except data index l h s corr1 corr2;