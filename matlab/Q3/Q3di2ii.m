%% Parameters

n = 20;
m = 100;
f = {'mean'; 'std'};
g = {'student'; 'normal'};
p = 0.95;
nu = 10;

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples;

%% Compute

% Setup
alpha = (1 - p) / 2;
cfd = struct;
tab1 = struct;
prop = struct;

% Compute
cfd.(g{1}) = [1, -1] * tinv(alpha, nu); % i) nu -> Inf : tinv -> norminv
cfd.(g{2}) = [1, -1] * norminv(alpha); % ii

for i = 1:size(index, 1)
    tab1.(index{i}) = struct;
    for j = 1:size(g, 1)
        tab1.(index{i}).(g{j}) = table;
        temp = cfd.(g{j}) .* stats.sample.(index{i}).std * size(sample{1}, 1)^(-1/2);
        tab1.(index{i}).(g{j}).cfd = temp + stats.sample.(index{i}).mean;
        tab1.(index{i}).(g{j}).has = hasIn(stats.dataset.(index{i}).mean, tab1.(index{i}).(g{j}).cfd);
        prop.(g{j}) = sum(tab1.(index{i}).(g{j}).has) / size(tab1.(index{i}).(g{j}).has, 1);
    end
end

%% Display

% Setup
tab2 = prop.(g{1});
for i = 2:size(g, 1)
	tab2 = [tab2; prop.(g{i})];
end
tab2.Properties.RowNames = g;

% Display

disp(tab2);

%% Clear workspace

clearvars -except dataset index stats sample tab1 prop;
