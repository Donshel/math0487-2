%% Parameters

n = 20;
m = 500;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1};
    'std_corr', 'std', {}
};
g = {'mean', 'mean', {}};

%% Calls

loadData;
pickSamples;

%% Compute

for i = 1:size(index, 1)
    tab.(index{i}) = table;
    for j = 1:size(f, 1) % for each function in #f
        temp = table;
        for k = 1:size(g, 1) % for each function in #g
            temp.(g{k, 1}) = feval(g{k, 2}, stats.sample.(index{i}).(f{j, 1}), g{k, 3}{:});
        end
        tab.(index{i})(end + 1, :) = temp;
    end
    tab.(index{i}).Properties.RowNames = f(:, 1);
end
