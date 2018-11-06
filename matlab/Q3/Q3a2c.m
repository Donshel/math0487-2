%% Calls

run('..\Q1\Q1b');

%% Parameters

f = {'mean'; 'median'};
g = {'Bias'; 'Variance'};
n = 20;
m = 100; % a & b) 100, c) 50

%% Code

% Setup
pickSamples;

tab = struct;

for i = 1:size(index, 1)
    b = mean(sample_stats.(index{i}){:,:}) - stats.(index{i}){:,f'};
    v = var(sample_stats.(index{i}){:,:});
    
    tab.(index{i}) = array2table([b;v], 'VariableNames', f', 'RowNames', g');
end

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats tab;
