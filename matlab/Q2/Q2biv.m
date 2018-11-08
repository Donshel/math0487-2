%% Parameters

n = 20;
m = 500;
f = {'mean'; 'median'; 'std'};
g = 'ksdistance';
precision = 1/10;
space = [0.02, 0.02];

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples;

%% Code

% Setup
freq = struct;
freq.dataset = struct;
freq.sample = struct;

% Compute
for i = 1:size(index, 1)
    freq.dataset.(index{i}) = frequency(dataset.(index{i}), precision);

    temp = zeros(size(sample, 1), 1);
    for j = 1:size(sample, 1)
        freq.sample(j).(index{i}) = frequency(sample{j}.(index{i}), precision);
        temp(j) = feval(g, freq.sample(j).(index{i})(:, 1:2), freq.dataset.(index{i})(:, 1:2));
    end
    stats.sample.(index{i}).(g) = temp;
end

%% Plot

Q2bPlot;

%% Clear workspace

clearvars -except dataset index stats sample freq;
