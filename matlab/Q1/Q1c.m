%% Parameters

f = {
    'mean', 'mean', {};
    'std', 'std', {1}
};
country = 'Belgium';

%% Calls

loadData;

%% Compute

% Setup
isNormed = table;

% Compute
for i = 1:size(index, 1)
    % Interval determination
    temp = [-1, 1] * stats.dataset.(index{i}).std;
    stats.dataset.(index{i}).interval = temp + stats.dataset.(index{i}).mean;

    % Proportion computation
    isNormed.(index{i}) = isIn(dataset.(index{i}), stats.dataset.(index{i}).interval);
    stats.dataset.(index{i}).proportion = sum(isNormed.(index{i}), 1) / size(dataset, 1);
end
isNormed.Properties.RowNames = dataset.Properties.RowNames;

% Search
iCountry = find(strcmp(dataset.Properties.RowNames, country));
isCountry = isNormed(iCountry, :);

%% Display

% Setup
tab = table;
for i = 1:size(index, 1)
	tab(end + 1, :) = stats.dataset.(index{i});
end
tab.Properties.RowNames = index;

% Display
disp(tab);
disp(isCountry);

%% Clear workspace

clearvars -except dataset index stats isNormed isCountry tab;
