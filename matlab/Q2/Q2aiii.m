%% Parameters

n = 20;
m = 1;
f = {};
g = {'ksdist', 'ks2stat', {}};

%% Calls

loadData;
pickSamples; sample = sample{1};

%% Compute

for i = 1:size(index, 1)
    g{3} = {dataset.(index{i})};
    temp = feval(g{2}, sample.(index{i}), g{3}{:});
    stats.sample.(index{i}).(g{1}) = temp;
end

%% Plot

for i = 1:size(index, 1)
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    cdfplot(dataset.(index{i}));
    hold on
         cdfplot(sample.(index{i}));
    hold off
    legend(fieldnames(stats));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');

%% Display

% Setup
tab = table;
for i = 1:size(index, 1)
    tab(end + 1, :) = stats.sample.(index{i});
end
tab.Properties.RowNames = index;

% Display
disp(tab);

%% Clear workspace

clearvars -except dataset index stats sample tab;
