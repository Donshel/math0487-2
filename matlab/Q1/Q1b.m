%% Parameters

f = {'mean'; 'median'; 'mode'; 'std'};

%% Calls

run('../scripts/addPath');
loadData;

%% Display

% Setup
tab = stats.dataset.(index{1});
for i = 2:size(index, 1)
	tab = [tab; stats.dataset.(index{i})];
end
tab.Properties.RowNames = index;

% Display
disp(tab);

%% Clear workspace

clearvars -except dataset index stats tab;
