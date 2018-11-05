%% Calls

run('..\Q1\Q1d');

%% Code

% Setup
data_sub = data(randi([1 h], n, 1));

for i = 2:l
    % Plot
    subplot(2,1,i - 1);
    x = [ [data(:).(index{i})]' ; [data_sub(:).(index{i})]' ];
    g = [1 * ones(h, 1); 2 * ones(n, 1)];
    boxplot(x, g, 'Labels', {'Population', 'Sample'}, 'Widths', 0.8, 'Whisker', 10);
    ylabel(index{i});
end

%% Clear workspace

clearvars -except data data_sub index l h;
