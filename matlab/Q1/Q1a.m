%% Calls

run('..\scripts\addPath');
loadWhole;

%% Parameters

space = [1, 0.5];

%% Code

for i = 1:size(index, 1)
    % Compute
    xmin = min(dataset.(index{i}));
    xmax = max(dataset.(index{i}));
    dom = floor(xmin):space(i):ceil(xmax);

    % Plot
    subplot(1, 2, i);
    histogram(dataset.(index{i}), dom);
    title(strcat(index{i}, {' '}, 'histogram'));
    xlabel(index{i});
    ylabel(strcat(index{1}, {' '}, 'number'));
end

%% Clear workspace

clearvars -except dataset index;
