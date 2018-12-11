%% Parameters

f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'mode', 'mode', {};
    'std', 'std', {1}
};

%% Calls

loadData;

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

clearvars -except dataset index stats tab;
