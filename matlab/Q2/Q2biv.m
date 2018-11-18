%% Parameters

n = 20;
m = 500;
f = {};
g = {'ksdist', 'ks2stat', {}};
space = [0.02, 0.02];

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
k = size(f, 1) + 1;
f(k, :) = g(:);

% Compute
for i = 1:size(index, 1)
    temp = zeros(size(sample, 1), 1);
    f{k, 3} = {dataset.(index{i})};
    for j = 1:size(sample, 1)
        temp(j) = feval(f{k, 2}, sample{j}.(index{i}), f{k, 3}{:});
    end
    stats.sample.(index{i}).(f{k, 1}) = temp;
end

%% Plot

Q2bhist;

%% Clear workspace

clearvars -except dataset index stats sample;
