%% Calls

Q1b;

%% Parameters

f = 'normal';

%% Code

% Setup

isNormed = whole.sample;
pNormed = zeros(size(index, 1) - 1, 1);

% Compute
for i = 2:size(index, 1)
    whole.stats.(index{i}).(f) = zeros(2, 1);
    whole.stats.(index{i}).(f)(1) = whole.stats.(index{i}).mean - whole.stats.(index{i}).std;
    whole.stats.(index{i}).(f)(end) = whole.stats.(index{i}).mean + whole.stats.(index{i}).std;

    for j = 1:whole.n
        isNormed(j).(index{i}) = isIn(isNormed(j).(index{i}), whole.stats.(index{i}).(f));
    end

    pNormed(i - 1) = sum([ isNormed.(index{i}) ]', 1) / whole.n;
end

% Belgium
iBelgium = find(strcmp({ whole.sample.(index{1}) }', 'Belgium'));
isBelgium = isNormed(iBelgium);

%% Clear workspace

clearvars -except whole index isNormed pNormed iBelgium isBelgium;
