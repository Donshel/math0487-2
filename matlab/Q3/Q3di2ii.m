%% Parameters

n = 20;
m = 100;
f = {
    'mean', 'mean', {};
    'std', 'std', {1};
    'std_corr', 'std', {0}
};
g = {
    'student', 'T', {10};
    'normal', 'Normal', {0, 1}
};
p = 0.95;

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
alpha = 1 - p;
tab = struct;

for i = 1:size(index, 1)
    tab.(index{i}) = table;

    % Compute
    temp = zeros(size(g, 1), 1);
    for j = 1:size(g, 1)
        interval = [-1, 1] * icdf(g{j, 2}, 1 - alpha / 2, g{j, 3}{:});
        interval = interval .* stats.sample.(index{i}).std_corr * n^(-1/2);
        interval = interval + stats.sample.(index{i}).mean;
        temp(j) = sum(hasIn(stats.dataset.(index{i}).mean, interval)) / m;
    end
    tab.(index{i}).proportion = temp;
    tab.(index{i}).Properties.RowNames = g(:, 1);
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats sample tab;
