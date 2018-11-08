% Setup
sample = cell(m, 1);
stats.sample = struct;

for j = 1:size(index, 1)
    stats.sample.(index{j}) = table;
end

% Compute
for i = 1:m
    sample{i} = dataset(randi([1 size(dataset, 1)], n, 1), :);
    for j = 1:size(index, 1)
        temp = table;
        for k = 1:size(f, 1)
            temp.(f{k}) = feval(f{k}, sample{i}.(index{j}));
        end
        stats.sample.(index{j}) = [stats.sample.(index{j}); temp];
    end
end
