%% Parameters

f = {'mean'; 'std'};
g = 'normed';
h = 'prop';
country = 'Belgium';

%% Calls

run('../scripts/addPath');
loadData;

%% Compute

% Setup
isNormed = dataset;

% Compute
for i = 1:size(index, 1)
    stats.dataset.(index{i}).(g) = [-1, 1] * stats.dataset.(index{i}).std + stats.dataset.(index{i}).mean;

    isNormed.(index{i}) = isIn(isNormed.(index{i}), stats.dataset.(index{i}).(g));
    stats.dataset.(index{i}).(h) = sum(isNormed.(index{i}), 1) / size(dataset, 1);
end

% Search
iCountry = find(strcmp(dataset.Properties.RowNames, country));
isCountry = isNormed(iCountry, :);

%% Display

% Setup
tab = stats.dataset.(index{1})(:, h);
for i = 2:size(index, 1)
	tab = [tab; stats.dataset.(index{i})(:, h)];
end
tab.Properties.RowNames = index;

% Display
disp(tab);
disp(isCountry);

%% Clear workspace

clearvars -except dataset index stats isNormed isCountry tab;
