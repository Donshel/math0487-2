%% Parameters

n = 20;
m = 500;
f = {'mean'; 'median'; 'std'};
ig = 1; % i) 1, ii) 2, iii) 3
g = f{ig};
h = {'mean'};
space = [0.5, 0.25]; % i) [0.5, 0.25], ii) [0.5, 0.25], iii) [0.5, 0.25]

%% Calls

run('..\scripts\addPath');
loadData;
pickSamples;

%% Compute

% Setup
tab1 = struct;

% Compute
for i = 1:size(index, 1)
    tab1.(index{i}) = struct;
    for j = 1:size(f, 1)
        tab1.(index{i}).(f{j}) = table;
        for k = 1:size(h, 1)
            tab1.(index{i}).(f{j}).(h{k}) = feval(h{k}, stats.sample.(index{i}).(f{j}));
        end
    end
end

%% Plot

Q2bPlot;

%% Display

% Setup
tab2 = struct;
for i = 1:size(index, 1)
    tab2.(index{i}) = tab1.(index{i}).(f{1});
    for j = 2:size(f, 1)
        tab2.(index{i}) = [tab2.(index{i}); tab1.(index{i}).(f{j})];
    end
    tab2.(index{i}).Properties.RowNames = f;
    
    % Display
    disp([index{i} ' :']);
    disp(tab2.(index{i})(ig, :));
end

%% Clear workspace

clearvars -except dataset index stats sample tab1;
