%% Calls

run('..\Q1\Q1b');

%% Parameters

f = {'mean'; 'median'};
g = {'gap'; 'var'};

global real;

n = 20;
m = 100; % a & b) 100, c) 50

%% Code

% Setup
pickSamples;
tab = struct;

% Compute
for i = 1:size(index, 1)
    tab.(index{i}) = struct;
    for j = 1:size(f, 1)
        tab.(index{i}).(f{j}) = table;
        real = stats.(index{i}).(f{j});
        for k = 1:size(g, 1)
            tab.(index{i}).(f{j}).(g{k}) = feval(g{k}, sample_stats.(index{i}).(f{j}));
        end
    end
end

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats tab;
