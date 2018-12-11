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
iCountry = find(strcmp(dataset.Properties.RowNames, country)); % search country

% Compute interval
for i = 1:size(index, 1)
    temp = [-1, 1] * stats.dataset.(index{i}).std;
    stats.dataset.(index{i}).interval = temp + stats.dataset.(index{i}).mean;
end

% Compute proportion
for i = 1:size(index, 1)
    isNormed.(index{i}) = isIn(dataset.(index{i}), stats.dataset.(index{i}).interval);
    stats.dataset.(index{i}).proportion = sum(isNormed.(index{i}), 1) / size(dataset, 1);
end
isNormed.Properties.RowNames = dataset.Properties.RowNames;

%% Display

% Setup
tab = table;
for i = 1:size(index, 1)
	tab(end + 1, :) = stats.dataset.(index{i});
end
tab.Properties.RowNames = index;

% Display
disp(tab);
disp(isNormed(iCountry, :));

%% Clear workspace

clearvars -except dataset index stats isNormed iCountry tab;
