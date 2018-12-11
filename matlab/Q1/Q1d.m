%% Calls

run('..\scripts\addPath');
loadWhole;

%% Code

for i = 2:size(index, 1)
    % Plot
    subplot(1, 2, i - 1);
    boxplot([ whole.sample.(index{i}) ]', 'Labels', 'Whole sample', 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except whole index;
