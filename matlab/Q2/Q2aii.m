%% Parameters

n = 20;
m = 1;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1}
};

%% Calls

loadData;
pickSamples; sample = sample{1};

%% Plot

for i = 1:size(index, 1)
    subplot(1, 2, i);
    a = [
        dataset.(index{i});
        sample.(index{i})
    ];
    b = [
        1 * ones(size(dataset, 1), 1);
        2 * ones(size(sample, 1), 1)
    ];
    boxplot(a, b, 'Labels', fieldnames(stats), 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except dataset index stats sample;
