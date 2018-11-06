%% Calls

run('..\Q1\Q1b');

%% Parameters

f = {'mean'; 'median'; 'std'};
n = 20;
m = 1;

%% Code

pickSamples;
sample_dataset = sample_dataset{1};

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;