%% Calls

Q2b;

%% Parameters

f = 'ks';
precision = 1/10;
space = [0.02, 0.02];

%% Code

for i = 1:size(index, 1)
    % Setupe
    temp = zeros(size(sample_dataset, 1), 1);

    % Compute
    tab = frequency(dataset.(index{i}), precision);

    for j = 1:size(sample_dataset, 1)
        sample_tab = frequency(sample_dataset{j}.(index{i}), precision);

        % Distance between values represented in both samples
        dom = ismember(tab.value, sample_tab.value);
        diff = tab.cumulated(dom) - sample_tab.cumulated;

        temp(j) = max(abs(diff));
    end

    sample_stats.(index{i}).(f) = temp;
end

% Plot
Q2bh;

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;
