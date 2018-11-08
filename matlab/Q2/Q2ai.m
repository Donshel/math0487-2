%% Parameters

n = 20;
m = 1;
f = {'mean'; 'median'; 'std'};

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples; sample = sample{1};

%% Display

% Setup
tab = struct;
for i = 1:size(index, 1)
    tab.(index{i}) = [stats.dataset.(index{i}); stats.sample.(index{i})];
    tab.(index{i}).Properties.RowNames = fieldnames(stats);
    
    % Display
    disp([index{i} ' :']);
    disp(tab.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats sample tab;
