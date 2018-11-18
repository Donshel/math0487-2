%% Parameters

n = 20;
m = 500;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1}
};
g = {'mean', 'mean', {}};

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
tab = struct;

% Compute
for i = 1:size(index, 1)
    tab.(index{i}) = table;
    for j = 1:size(f, 1)
        temp = table;
        for k = 1:size(g, 1)
            temp.(g{k, 1}) = feval(g{k, 2}, stats.sample.(index{i}).(f{j, 1}), g{k, 3}{:});
        end
        tab.(index{i})(end + 1, :) = temp;
    end
    tab.(index{i}).Properties.RowNames = f(:, 1);
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i}));
end