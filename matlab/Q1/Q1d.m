%% Calls

run('..\scripts\addPath');
loadData;

%% Code

for i = 2:l
    % Plot
    subplot(1,2,i - 1);
    boxplot([data(:).(index{i})]', 'Labels', 'Population', 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except data index l h;
