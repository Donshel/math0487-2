%% Calls

run('..\Q1\Q1b');

%% Parameters

n = 20;

%% Code

% Setup
f = {'mean'; 'median'; 'mode'; 'var'; 'std'};
data_sub = data(randi([1 h], n, 1));
s_sub = struct;

% Compute
for i = 2:l
    s_sub(i - 1).data = index{i};
    for j = 1:size(f, 1)
        s_sub(i - 1).(f{j}) = feval(f{j}, [data_sub(:).(index{i})]');
    end
end
tab_sub = struct2table(s_sub);

%% Clear workspace

clearvars -except data data_sub index l h s s_sub tab tab_sub;
