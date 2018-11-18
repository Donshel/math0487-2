for i = 1:size(index, 1)
    % Setup
    temp = min(stats.sample.(index{i}).(f{k, 1}));
    xmin = temp - mod(temp, space(i));
    temp = max(stats.sample.(index{i}).(f{k, 1}));
    xmax = temp - mod(temp, space(i)) + space(i);
    edges = xmin:space(i):xmax;

    % Plot
    subplot(1, 2, i);
    histogram(stats.sample.(index{i}).(f{k, 1}), edges);
    xlabel(strcat(index{i}, {' '}, f{k, 1}));
    ylabel('Number');
end
