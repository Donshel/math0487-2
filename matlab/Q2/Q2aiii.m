%% Calls

Q2ai;

%% Parameters

precision = 1/10;
f = 'ksdistance';

%% Code

for i = 1:size(index, 1)
    % Compute
    dataset_frequency = frequency(dataset.(index{i}), precision);
    sample_frequency = frequency(sample_dataset.(index{i}), precision);
    
    sample_stats.(index{i}).(f) = feval(f, sample_frequency(:, 1:2), dataset_frequency(:, 1:2));

    % Plot
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    plot(dataset_frequency(:, 1), dataset_frequency(:, 2));
    hold on
         plot(sample_frequency(:, 1), sample_frequency(:, 2));
    hold off
    legend('Dataset', 'Sample');
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;
