%% Calls

Q1b;

%% Code

% Setup

isNormed = struct;
pNormed = zeros(l - 1, 1);

% Compute
for i = 1:l - 1
    s(i).normal = [s(i).mean - s(i).std, s(i).mean + s(i).std];
end

for j = 1:h
    isNormed(j).(index{1}) = data(j).(index{1});
    for i = 2:l
        a = data(j).(index{i}) >= s(i - 1).normal(1);
        b = data(j).(index{i}) <= s(i - 1).normal(2);
        isNormed(j).(index{i}) = a .* b;
    end
end

for i = 1:l - 1
    pNormed(i) = sum([isNormed(:).(index{i + 1})]', 1) / h;
end

% Belgium
iBelgium = find(strcmp({data(:).(index{1})}', 'Belgium'));
isBelgium = isNormed(iBelgium);

%% Clear workspace

clearvars -except data index l h s isNormed pNormed iBelgium isBelgium;
