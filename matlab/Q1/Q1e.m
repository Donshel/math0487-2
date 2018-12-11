%% Calls

Q1b;

%% Parameters

f = 'frequency';
n = 10;

%% Code

for i = 2:size(index, 1)
    % Compute
    whole.stats.(index{i}).(f) = frequency([ whole.sample.(index{i}) ]' * n);
    whole.stats.(index{i}).(f)(:, 1) = whole.stats.(index{i}).(f)(:, 1) / n;

    % Plot
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) '- 1);']);
    plot(whole.stats.(index{i}).(f)(:, 1), whole.stats.(index{i}).(f)(:, 3));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot2, plot3], 'y');

%% Clear workspace

clearvars -except whole index;
