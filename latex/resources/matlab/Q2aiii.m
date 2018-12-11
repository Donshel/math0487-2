%% Parameters

n = 20;
m = 3;
f = {};
g = {'ksdist', 'ks2stat', {}};

%% Calls

loadData;
pickSamples;

%% Compute

for i = 1:size(index, 1)
    g{3} = {dataset.(index{i})};
    temp = zeros(m, 1);
    for j = 1:m
        temp(j) = feval(g{2}, sample{j}.(index{i}), g{3}{:});
    end
    stats.sample.(index{i}).(g{1}) = temp;
end

%% Plot

for i = 1:size(index, 1)
    % Setup
    names = fieldnames(stats);
    legends = {names{1}};
    for j = 1:m
        legends{end + 1, 1} = [names{2}, ' ', num2str(j)];
    end
    
    % Plot
    subplot(1, 2, i);
    cdfplot(dataset.(index{i}));
    hold on
        for j = 1:m
            cdfplot(sample{j}.(index{i}));
        end
    hold off
    legend(legends);
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(stats.sample.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats;
