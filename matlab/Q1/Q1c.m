%% Calls

Q1b;

%% Parameters

f = 'normed';
g = 'prop';

%% Code

% Setup

isNormed = dataset;

% Compute
for i = 1:size(index, 1)
    stats.(index{i}).(f) = zeros(1, 2);
    stats.(index{i}).(f)(1) = stats.(index{i}).mean - stats.(index{i}).std;
    stats.(index{i}).(f)(end) = stats.(index{i}).mean + stats.(index{i}).std;

    isNormed.(index{i}) = isIn(isNormed.(index{i}), stats.(index{i}).(f));
    stats.(index{i}).(g) = sum(isNormed.(index{i}), 1) / size(dataset, 1);
end

% Belgium
iBelgium = find(strcmp(dataset.Properties.RowNames, 'Belgium'));
isBelgium = isNormed(iBelgium, :);

%% Clear workspace

clearvars -except dataset index stats isNormed iBelgium isBelgium;
