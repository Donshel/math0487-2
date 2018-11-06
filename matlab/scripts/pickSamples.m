% Setup
sample_dataset = cell(m, 1);
sample_stats = struct;

for j = 1:size(index, 1)
    sample_stats.(index{j}) = table;
end

for i = 1:m
    sample_dataset{i} = dataset(randi([1 size(dataset, 1)], n, 1), :);

    % Compute
    for j = 1:size(index, 1)
        temp = table;
        for k = 1:size(f, 1)
            temp.(f{k}) = feval(f{k}, sample_dataset{i}.(index{j}));
        end
        sample_stats.(index{j}) = [sample_stats.(index{j}); temp];
    end
end
