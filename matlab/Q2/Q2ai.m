%% Parameters

n = 20;
m = 1;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1}
};

%% Calls

loadData;
pickSamples; sample = sample{1};

%% Display

% Setup
tab = table;
for i = 1:size(index, 1)
    tab(end + 1, :) = stats.sample.(index{i});
end
tab.Properties.RowNames = index;

% Display
disp(tab);

%% Clear workspace

clearvars -except dataset index stats sample tab;
