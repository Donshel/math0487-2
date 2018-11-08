%% Parameters

n = 20;
m = 100; % a & b) 100, c) 50
f = {'mean'; 'median'; 'std'};
g = {'gap'; 'var'};

global real;

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples;

%% Comute

% Setup
tab1 = struct;

% Compute
for i = 1:size(index, 1)
    tab1.(index{i}) = struct;
    for j = 1:size(f, 1)
        tab1.(index{i}).(f{j}) = table;
        real = stats.dataset.(index{i}).(f{j});
        for k = 1:size(g, 1)
            tab1.(index{i}).(f{j}).(g{k}) = feval(g{k}, stats.sample.(index{i}).(f{j}));
        end
    end
end

%% Display

% Setup
tab2 = tab1.(index{1}).(f{1});
for i = 2:size(f, 1)
	tab2 = [tab2; tab1.(index{1}).(f{i})];
end
tab2.Properties.RowNames = f;

% Display

disp(tab2);

%% Clear workspace

clearvars -except dataset index stats sample tab1 tab2;
