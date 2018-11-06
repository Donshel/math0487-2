%% Calls

Q2ai;

%% Code

for i = 1:size(index, 1)
    % Plot
    subplot(2, 1, i);
    x = [dataset.(index{i}); sample_dataset.(index{i})];
    g = [1 * ones(size(dataset, 1), 1); 2 * ones(size(sample_dataset, 1), 1)];
    boxplot(x, g, 'Labels', {'Dataset', 'Sample'}, 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except dataset index stats sample_dataset;
