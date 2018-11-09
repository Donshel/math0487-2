%% Parameters

n = 20;
m = 1;
f = {'mean'; 'median'; 'std'};

%% Calls

run('../scripts/addPath');
loadData;
pickSamples; sample = sample{1};

%% Plot

for i = 1:size(index, 1)
    subplot(2, 1, i);
    x = [dataset.(index{i}); sample.(index{i})];
    g = [1 * ones(size(dataset, 1), 1); 2 * ones(size(sample, 1), 1)];
    boxplot(x, g, 'Labels', fieldnames(stats), 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except dataset index stats sample;
