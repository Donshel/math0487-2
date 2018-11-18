% Setup
sample = cell(m, 1);
stats.sample = struct;

rng default; % for reproducibility

for i = 1:m
    sample{i} = dataset(randi([1 size(dataset, 1)], n, 1), :);
end

% Compute
for i = 1:size(index, 1)
    stats.sample.(index{i}) = table;
    for j = 1:size(f, 1)
        temp = zeros(m, 1);
        for k = 1:m
            temp(k) = feval(f{j, 2}, sample{k}.(index{i}), f{j, 3}{:});
        end
        stats.sample.(index{i}).(f{j, 1}) = temp;
    end
end
