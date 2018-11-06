for i = 1:size(index, 1)
    % Setup
    xmin = min(sample_stats.(index{i}).(f));
    xmax = max(sample_stats.(index{i}).(f));
    edges = floor(xmin):space(i):ceil(xmax);

    % Plot
    subplot(1, 2, i);
    histogram(sample_stats.(index{i}).(f), edges);
    title(strcat(index{i}, {' '}, f, {' '}, 'histogram'));
    xlabel(strcat(index{i}, {' '}, f));
    ylabel('Number');
end
