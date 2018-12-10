%% Calls

loadData;

%% Code

% Setup
f = {'mean'; 'median'; 'mode'; 'var'; 'std'};
s = struct;

% Compute
for i = 2:l
    s(i - 1).('data') = index{i};
    for j = 1:size(f, 1)
        s(i - 1).(f{j}) = feval(f{j}, [data(:).(index{i})]');
    end
end
tab = struct2table(s);

%% Clear workspace

clearvars -except data index l h s tab;
