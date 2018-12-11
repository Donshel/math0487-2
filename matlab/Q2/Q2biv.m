%% Parameters

n = 20;
m = 500;
f = {};
g = {'ksdist', 'ks2stat', {}};
space = [0.01, 0.01];

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
k = size(f, 1) + 1;
f(k, :) = g(:); % add a new function in #f

% Compute
for i = 1:size(index, 1)
    temp = zeros(m, 1);
    f{k, 3} = {dataset.(index{i})}; % change @ks2stat parameter according to population
    for j = 1:m % for each sample
        temp(j) = feval(f{k, 2}, sample{j}.(index{i}), f{k, 3}{:});
    end
    stats.sample.(index{i}).(f{k, 1}) = temp;
end

%% Plot

Q2bhist;

%% Clear workspace

clearvars -except dataset index stats;
