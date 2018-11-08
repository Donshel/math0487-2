%% Parameters

n = 20;
m = 1;
f = {};
g = 'ksdistance';
precision = 1/10;

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples; sample = sample{1};

%% Compute

% Setup
freq = struct;
freq.dataset = struct;
freq.sample = struct;

% Compute
for i = 1:size(index, 1)
    freq.dataset.(index{i}) = frequency(dataset.(index{i}), precision);
    freq.sample.(index{i}) = frequency(sample.(index{i}), precision);

    temp = feval(g, freq.sample.(index{i})(:, 1:2), freq.dataset.(index{i})(:, 1:2));
    stats.sample.(index{i}).(g) = temp;
end

%% Plot

for i = 1:size(index, 1)
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    plot(freq.dataset.(index{i})(:, 1), freq.dataset.(index{i})(:, 2));
    hold on
         plot(freq.sample.(index{i})(:, 1), freq.sample.(index{i})(:, 2));
    hold off
    legend(fieldnames(stats));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');

%% Display

% Setup
tab = stats.sample.(index{1});
for i = 2:size(index, 1)
    tab = [tab; stats.sample.(index{i})];   
end
tab.Properties.RowNames = index;

% Display
disp(tab);

%% Clear workspace

clearvars -except dataset index stats sample freq tab;
