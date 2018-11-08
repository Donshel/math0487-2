for i = 1:size(index, 1)
    % Setup
    xmin = min(stats.sample.(index{i}).(g));
    xmax = max(stats.sample.(index{i}).(g));
    edges = xmin:space(i):xmax;

    % Plot
    subplot(1, 2, i);
    histogram(stats.sample.(index{i}).(g), edges);
    title(strcat(index{i}, {' '}, g, {' '}, 'histogram'));
    xlabel(strcat(index{i}, {' '}, g));
    ylabel('Number');
end
