%% Calls

run('..\scripts\addPath');
loadData;

%% Plot

for i = 1:size(index, 1)
    subplot(1, 2, i);
    boxplot(dataset.(index{i}), 'Labels', fieldnames(stats), 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except dataset index;
