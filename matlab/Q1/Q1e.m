%% Calls

Q1b;

%% Parameters

precision = 1/10;

%% Code

for i = 1:size(index, 1)
    % Compute
    freq = frequency(dataset.(index{i}), precision);

    % Plot
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    plot(freq.value, freq.cumulated);
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');

%% Clear workspace

clearvars -except dataset index stats;
