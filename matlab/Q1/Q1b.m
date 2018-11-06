%% Calls

run('..\scripts\addPath');
loadWhole;

%% Parameters

f = {'mean'; 'median'; 'mode'; 'std'};

%% Code

% Setup
stats = struct;

% Compute
for i = 1:size(index, 1)
    stats.(index{i}) = table;
    for j = 1:size(f, 1)
        stats.(index{i}).(f{j}) = feval(f{j}, dataset.(index{i}));
    end
end

%% Clear workspace

clearvars -except dataset index stats;
