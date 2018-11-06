%% Calls

Q2ai;

%% Parameters

f = 'ks';
precision = 1/10;

%% Code

for i = 1:size(index, 1)
    % Compute
    tab = frequency(dataset.(index{i}), precision);
    sample_tab = frequency(sample_dataset.(index{i}), precision);

    % Distance between values represented in both samples
    dom = ismember(tab.value, sample_tab.value);
    diff = tab.cumulated(dom) - sample_tab.cumulated;

    sample_stats.(index{i}).(f) = max(abs(diff));

    % Plot
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    plot(tab.value, tab.cumulated);
    hold on
         plot(sample_tab.value, sample_tab.cumulated);
         plot(sample_tab.value, abs(diff));
    hold off
    legend('Dataset', 'Sample', 'Distance');
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;
