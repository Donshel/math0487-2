%% Calls

loadData;

%% Parameters

nbins = 10;

%% Code

for i = 2:l
    % Compute
    v_min = min([data(:).(index{i})]');
    v_max = max([data(:).(index{i})]');
    lbins = floor((v_max - v_min) / nbins);
    edges = floor(v_min):lbins:floor(v_max);

    % Plot
    subplot(1,2,i - 1);
    histogram([data(:).(index{i})]', edges);
    title(strcat(index{i}, {' '}, 'histogram'));
    xlabel(index{i});
    ylabel(strcat(index{1}, {' '}, 'number'));
end

%% Clear workspace

clearvars -except data index l h;
