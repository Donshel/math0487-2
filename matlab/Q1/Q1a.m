%% Calls

run('..\scripts\addPath');
loadWhole;

%% Parameters

space = [1, 0.5];

%% Code

for i = 2:size(index, 1)
    % Compute
    v_min = min([ whole.sample.(index{i}) ]');
    v_max = max([ whole.sample.(index{i}) ]');
    edges = floor(v_min):space(i - 1):ceil(v_max);

    % Plot
    subplot(1, 2, i - 1);
    histogram([ whole.sample.(index{i}) ]', edges);
    title( strcat(index{i}, {' '}, 'histogram') );
    xlabel( index{i} );
    ylabel( strcat(index{1}, {' '}, 'number') );
end

%% Clear workspace

clearvars -except whole index;
