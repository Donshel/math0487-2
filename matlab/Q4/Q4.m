%% Parameters

n = 40;
o = 5;
m = 100 * o;
f = {'mean'; 'std'};
country = 'Belgium';

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples;

%% Compute

% Setup
x = table;

% Compute
iCountry = find(strcmp(dataset.Properties.RowNames, country));
for i = 1:size(index, 1)
    temp = sum(dataset.(index{i}) < dataset{iCountry, index{i}});
	x.(index{i}) = temp / size(dataset, 1);
end
