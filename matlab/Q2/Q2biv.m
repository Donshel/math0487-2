%% Calls

Q2b;

%% Parameters

f = 'ksdistance';
precision = 1/10;
space = [0.02, 0.02];

%% Code

for i = 1:size(index, 1)
    % Setup
    temp = zeros(size(sample_dataset, 1), 1);

    % Compute
    dataset_frequency = frequency(dataset.(index{i}), precision);

    for j = 1:size(sample_dataset, 1)
        sample_frequency = frequency(sample_dataset{j}.(index{i}), precision);

        temp(j) = feval(f, sample_frequency(:, 1:2), dataset_frequency(:, 1:2));
    end

    sample_stats.(index{i}).(f) = temp;
end

% Plot
Q2bh;

%% Clear workspace

clearvars -except dataset index stats sample_dataset sample_stats;
