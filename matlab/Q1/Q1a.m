%% Parameters

space = [1, 0.5];

%% Calls

run('../scripts/addPath');
loadData;

%% Plot

for i = 1:size(index, 1)
    % Setup
    xmin = min(dataset.(index{i}));
    xmax = max(dataset.(index{i}));
    dom = floor(xmin):space(i):ceil(xmax);

    % Plot
    subplot(1, 2, i);
    histogram(dataset.(index{i}), dom);
    title(strcat(index{i}, {' '}, 'histogram'));
    xlabel(index{i});
    ylabel(strcat('Country number'));
end

%% Clear workspace

clearvars -except dataset index;
