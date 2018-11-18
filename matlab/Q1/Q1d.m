%% Parameters

f = {
    'quantile25', 'quantile', {0.25};
    'median', 'median', {};
    'quantile75', 'quantile', {0.75}
};

%% Calls

loadData;

%% Plot

for i = 1:size(index, 1)
    subplot(1, 2, i);
    boxplot(dataset.(index{i}), 'Labels', 'dataset', 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Display

% Setup
tab = table;
for i = 1:size(index, 1)
	tab(end + 1, :) = stats.dataset.(index{i});
end
tab.Properties.RowNames = index;

% Display
disp(tab);

%% Clear workspace

clearvars -except dataset index;
