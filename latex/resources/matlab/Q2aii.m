%% Parameters

n = 20;
m = 3;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1}
};

%% Calls

loadData;
pickSamples;

%% Plot

for i = 1:size(index, 1)
    % Setup
    a = [dataset.(index{i})];
    b = zeros(size(dataset, 1), 1);
    
    names = fieldnames(stats);
    labels = {names{1}};
    for j = 1:m
        a = [a; sample{j}.(index{i});];
        b = [b; j * ones(n, 1) ];
        labels{end + 1, 1} = [names{2}, ' ', num2str(j)];
    end
    
    % Plot
    subplot(1, 2, i);
    boxplot(a, b, 'Labels', labels, 'Widths', 0.8);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except dataset index stats;
