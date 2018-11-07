%% Calls

Q2b;

%% Parameters

f = 'mean'; % i) 'mean', ii) 'median', iii) 'std'
g = {'mean'};
space = [0.5, 0.25]; % i) [0.5, 0.25], ii) [0.5, 0.25], iii) [0.5, 0.25]

%% Code

% Setup
tab = struct;

% Compute
for i = 1:size(index, 1)
    tab.(index{i}) = struct;
    tab.(index{i}).(f) = table;
    for j = 1:size(g, 1)
        tab.(index{i}).(f).(g{j}) = feval(g{j}, sample_stats.(index{i}).(f));
    end
end

% Plot
Q2bh;

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats tab;
