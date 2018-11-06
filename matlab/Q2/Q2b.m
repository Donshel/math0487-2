%% Calls

run('..\Q1\Q1b');

%% Parameters

f = {'mean'; 'median'; 'std'};
n = 20;
m = 500;

%% Code

pickSamples;

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;
