%% Parameters

space = [1, 0.5];

%% Calls

loadData;

%% Plot

for i = 1:size(index, 1)
    % Setup
    temp = min(dataset.(index{i}));
    xmin = temp - mod(temp, space(i));
    temp = max(dataset.(index{i}));
    xmax = temp - mod(temp, space(i)) + space(i);
    dom = xmin:space(i):xmax;

    % Plot
    subplot(1, 2, i);
    histogram(dataset.(index{i}), dom);
    xlabel(index{i});
    ylabel(strcat('Country number'));
end

%% Clear workspace

clearvars -except dataset index;
