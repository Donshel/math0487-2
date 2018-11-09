%% Parameters

precision = 1/10;

%% Calls

run('../scripts/addPath');
loadData;

%% Compute

% Setup
freq = struct;

% Compute
for i = 1:size(index, 1)
    freq.(index{i}) = frequency(dataset.(index{i}), precision);
end

%% Plot

for i = 1:size(index, 1)
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    plot(freq.(index{i})(:, 1), freq.(index{i})(:, 2));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');
ylim([0 1]);

%% Clear workspace

clearvars -except dataset index freq;
