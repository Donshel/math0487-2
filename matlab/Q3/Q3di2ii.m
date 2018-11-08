%% Calls

run('..\Q1\Q1b');

%% Parameters

f = {'mean'; 'std'};
g = {'stu'; 'nrm'};

n = 20;
m = 100;
P = 0.95;
nu = 10;

%% Code

% Setup
pickSamples;
alpha = (1 - P) / 2;
cfd = struct;
tab = struct;
prop = struct;

% Compute
cfd.(g{1}) = [1, -1] * tinv(alpha, nu); % i) nu -> Inf : tinv -> norminv
cfd.(g{2}) = [1, -1] * norminv(alpha); % ii

for i = 1:size(index, 1)
    tab.(index{i}) = struct;
    for j = 1:size(g, 1)
        tab.(index{i}).(g{j}) = table;
        temp = cfd.(g{j}) .* sample_stats.(index{i}).std * size(sample_dataset{1}, 1)^(-1/2);
        tab.(index{i}).(g{j}).cfd = temp + sample_stats.(index{i}).mean;
        tab.(index{i}).(g{j}).has = hasIn(stats.(index{i}).mean, tab.(index{i}).(g{j}).cfd);

        prop.(g{j}) = sum(tab.(index{i}).(g{j}).has) / size(tab.(index{i}).(g{j}).has, 1);
    end
end

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats tab prop;
