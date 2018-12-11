%% Calls

Q2a;

%% Code

for i = 2:size(index, 1)
    % Plot
    subplot(2, 1, i - 1);
    x = [[ whole.sample.(index{i}) ]'; [ sub.sample.(index{i}) ]'];
    g = [1 * ones(whole.n, 1); 2 * ones(sub.n, 1)];
    boxplot(x, g, 'Labels', {'Whole sample', 'Sub sample'}, 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except whole sub index;
